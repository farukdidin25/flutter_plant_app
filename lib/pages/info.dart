// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/init/lang/locale_keys.g.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.about.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage('assets/images/profil.jpeg'), // Fotoğraf dosyanızın yolu
              ),
            ),
            buildInfoRow(LocaleKeys.name.tr(), 'Ömer Faruk', Icons.person),
            buildInfoRow(LocaleKeys.surname.tr(), 'Didin', Icons.person),
            buildInfoRow(LocaleKeys.university.tr(), LocaleKeys.eruniversity.tr(), Icons.school),
            buildInfoRow(LocaleKeys.faculty.tr(), LocaleKeys.erufaculty.tr(), Icons.domain),
            buildInfoRow(LocaleKeys.license.tr(), LocaleKeys.erulicense.tr(), Icons.computer),
            buildInfoRow(LocaleKeys.clas.tr(), LocaleKeys.eruclass.tr(), Icons.class_),
            buildInfoRow(LocaleKeys.software.tr(), '.NET, HTML, CSS, C#, Flutter', Icons.code),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String content, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}