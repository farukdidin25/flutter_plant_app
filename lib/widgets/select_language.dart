import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/enum/locale_enum.dart';
import 'package:flutter_plant_app/upload/upload_file.dart';


class SelectLanguage extends Padding {
  final BuildContext context;

  SelectLanguage({super.key, required this.context})
      : super(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: DropdownButton(
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.white,
              padding: const EdgeInsets.all(15),
              isDense: true,
              hint: const Icon(
                Icons.language_rounded,
                color: Colors.white,
              ),
              underline: const SizedBox(),
              items: AppLanguages.Languages.asMap()
                  .map((index, value) => MapEntry(
                      index,
                      DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      )))
                  .values
                  .toList(),
              onChanged: (newValue) {
                int selectedIndex = AppLanguages.Languages.indexOf(newValue as String);
                context.setLocale(AppLanguages.supportedLanguages[selectedIndex]);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const UploadImageAndMore())
                );
              },
            ),
          ),
        );
}