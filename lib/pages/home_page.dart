// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/utils/custom_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.textButtonColor,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/plant.jpg', // Görselinizin bulunduğu dizini ve dosya adını buraya ekleyin
              width: 400,
              height: 350,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
