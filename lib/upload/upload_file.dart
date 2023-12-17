// ignore_for_file: unused_element, empty_catches, use_build_context_synchronously, sized_box_for_whitespace

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/init/lang/locale_keys.g.dart';
import 'package:flutter_plant_app/pages/howto_page.dart';
import 'package:flutter_plant_app/pages/info.dart';
import 'package:flutter_plant_app/utils/custom_colors.dart';
import 'package:flutter_plant_app/widgets/select_language.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageAndMore extends StatefulWidget {
  const UploadImageAndMore({super.key});

  @override
  State<UploadImageAndMore> createState() => _UploadImageAndMoreState();
}

class _UploadImageAndMoreState extends State<UploadImageAndMore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("Upload_Items");

  String imageUrl = '';

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(LocaleKeys.createyouritems.tr()),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: LocaleKeys.name.tr(),
                      hintText: LocaleKeys.rose.tr()),
                ),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(
                      labelText: LocaleKeys.type.tr(),
                      hintText: LocaleKeys.flower.tr()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: IconButton(
                        onPressed: () async {
                          final file = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (file == null) return;

                          String fileName =
                              DateTime.now().microsecondsSinceEpoch.toString();

                          Reference referenceRoot =
                              FirebaseStorage.instance.ref();
                          Reference referenceDireImages =
                              referenceRoot.child('images');

                          Reference referenceImageaToUpload =
                              referenceDireImages.child(fileName);

                          try {
                            await referenceImageaToUpload
                                .putFile(File(file.path));

                            imageUrl =
                                await referenceImageaToUpload.getDownloadURL();
                          } catch (error) {}
                        },
                        icon: const Icon(Icons.photo))),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          if (imageUrl.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(LocaleKeys.upload.tr())));
                            return;
                          }
                          final String name = _nameController.text;
                          final String type = _typeController.text;
                          await _items.add({
                            "name": name,
                            "type": type,
                            "image": imageUrl,
                          });
                          _nameController.text = '';
                          _typeController.text = '';
                          Navigator.of(context).pop();
                        },
                        child: Text(LocaleKeys.create.tr())))
              ],
            ),
          );
        });
  }

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('Upload_Items').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.loginButtonTextColor,
      appBar: AppBar(
        actions: [
          SelectLanguage(context: context),
        ],
        title: Text(LocaleKeys.upload.tr()),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[200], // Açık mavi tonu
                shape: BoxShape.circle, // Container'ı daire şeklinde yapar
              ),
              child: ClipOval(
                child: Container(
                  width: 100,
                  height: 100,
                  color:
                      Colors.transparent, // Görselin etrafında boşluk oluşturur
                  child: Image.asset(
                    "assets/images/tiny_plant.jpg",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(LocaleKeys.about.tr(),style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
            ListTile(
              title: Text(LocaleKeys.howtouse.tr(),style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HowTo()),
                );
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Some error occured${snapshot.error}"),
              );
            }

            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;

              List<Map> items = document.map((e) => e.data() as Map).toList();

              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map thisItems = items[index];
                    return ListTile(
                      title: Text(
                        "${thisItems['name']}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      subtitle: Text("${thisItems['type']}"),
                      leading: Container(
                        width: 80,
                        height: 80,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(8.0), // Kenar yuvarlaklığı
                          child: thisItems.containsKey('image')
                              ? Image.network(
                                  "${thisItems['image']}",
                                  fit: BoxFit.cover,
                                )
                              : const Placeholder(), // Placeholder yerine kendi boş widget'ınızı ekleyebilirsiniz
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _create();
        },
        child: const Icon(Icons.photo),
      ),
    );
  }
}
