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
    apiKey: 'AIzaSyBkkGzsuiK_xcCEQBX8u5GwgPdYVvVcj2I',
    appId: '1:395693444908:web:f3226ad3aa78441d1ce689',
    messagingSenderId: '395693444908',
    projectId: 'mobilysystem',
    authDomain: 'mobilysystem.firebaseapp.com',
    storageBucket: 'mobilysystem.appspot.com',
    measurementId: 'G-5F6WNNB4DV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2DtkD8o_OEWYz4PywoyXSTHlvuqMjZTo',
    appId: '1:395693444908:android:d4dc4661b73864b31ce689',
    messagingSenderId: '395693444908',
    projectId: 'mobilysystem',
    storageBucket: 'mobilysystem.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBH02_J3K0QD4YmglQZHR07XRTcTQIan_U',
    appId: '1:395693444908:ios:91c7003ddeb849861ce689',
    messagingSenderId: '395693444908',
    projectId: 'mobilysystem',
    storageBucket: 'mobilysystem.appspot.com',
    iosBundleId: 'com.example.mobilysystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBH02_J3K0QD4YmglQZHR07XRTcTQIan_U',
    appId: '1:395693444908:ios:723820cdf1898b681ce689',
    messagingSenderId: '395693444908',
    projectId: 'mobilysystem',
    storageBucket: 'mobilysystem.appspot.com',
    iosBundleId: 'com.example.mobilysystem.RunnerTests',
  );
}
