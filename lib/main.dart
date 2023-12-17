// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/enum/language_enum.dart';
import 'package:flutter_plant_app/pages/auth/login_page.dart';
import 'package:flutter_plant_app/pages/auth/sign_up.dart';
import 'package:flutter_plant_app/pages/home_page.dart';
import 'package:flutter_plant_app/upload/upload_file.dart';
import 'package:flutter_plant_app/utils/application.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(child: MyApp(), supportedLocales: Application.supportedLanguages.toLocale().toList(), path: Application.path.translation));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Plant APP',
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => HomePage(),
        "/uploadImageAndMore": (context) => UploadImageAndMore(),
        // '/plantInfo': (context) => PlantInfoPage(),
        // '/addPlant': (context) => AddPlantPage(),
      },
      theme: ThemeData(
      ),
      home: Scaffold(

        body: LoginPage(),
      ),
    );
  }
}