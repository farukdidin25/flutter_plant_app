// ignore_for_file: use_key_in_widget_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/init/lang/locale_keys.g.dart';
import 'package:flutter_plant_app/utils/custom_colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: CustomColors.textButtonColor,
        title: Text(LocaleKeys.homepage.tr()),
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
