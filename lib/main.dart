// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/pages/auth/login_page.dart';
import 'package:flutter_plant_app/pages/auth/sign_up.dart';
import 'package:flutter_plant_app/pages/home_page.dart';
import 'package:flutter_plant_app/utils/custom_colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/signUp": (context) => SignUp(),
        "/homePage": (context) => HomePage(),
        //"/uploadImageAndMore": (context) => UploadImageAndMore(),
        // '/plantInfo': (context) => PlantInfoPage(),
        // '/addPlant': (context) => AddPlantPage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}