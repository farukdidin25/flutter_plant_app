import 'package:flutter_plant_app/core/enum/language_enum.dart';

class Application {
  static const Languages language = Languages.english;
  static const Iterable<Languages>  supportedLanguages = Languages.values;
  static const ApplicationPaths path = ApplicationPaths();
}

class ApplicationPaths{
  const ApplicationPaths();
  final String translation = 'assets/translations';
  final String images = 'assets/images';
}