// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC0MlgFgMjosvfGnmzRbgnCT03XSDgrnRU',
    appId: '1:694901288625:web:b65a7beba0996c0601bc90',
    messagingSenderId: '694901288625',
    projectId: 'plant2525',
    authDomain: 'plant2525.firebaseapp.com',
    storageBucket: 'plant2525.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASBsBsj-SNERnVrWklymerqcX90mflqpQ',
    appId: '1:694901288625:android:33ee3cd12800d9b101bc90',
    messagingSenderId: '694901288625',
    projectId: 'plant2525',
    storageBucket: 'plant2525.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJiqATiN3pCntaBQIRP8oGC8KT5GzqNkk',
    appId: '1:694901288625:ios:71a7b575cbf98ed101bc90',
    messagingSenderId: '694901288625',
    projectId: 'plant2525',
    storageBucket: 'plant2525.appspot.com',
    iosBundleId: 'com.example.flutterPlantApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJiqATiN3pCntaBQIRP8oGC8KT5GzqNkk',
    appId: '1:694901288625:ios:c93b47710b3792a101bc90',
    messagingSenderId: '694901288625',
    projectId: 'plant2525',
    storageBucket: 'plant2525.appspot.com',
    iosBundleId: 'com.example.flutterPlantApp.RunnerTests',
  );
}