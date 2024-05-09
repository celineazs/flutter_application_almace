// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAqrlg_LlnZPbWcZIqGXBRIQrt6yhgCF6w',
    appId: '1:752418063958:web:354747654974dadf2f9df7',
    messagingSenderId: '752418063958',
    projectId: 'almacen-camion',
    authDomain: 'almacen-camion.firebaseapp.com',
    storageBucket: 'almacen-camion.appspot.com',
    measurementId: 'G-HZWLZMTWHE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkvtNVNLzz9Wpgpya4kkTjN_2aCFcOqck',
    appId: '1:752418063958:android:6c6f430a2bbf03cf2f9df7',
    messagingSenderId: '752418063958',
    projectId: 'almacen-camion',
    storageBucket: 'almacen-camion.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCWpfzEPRG9FRyrme437_iWE-L6w9e_c0',
    appId: '1:752418063958:ios:35f9a59a8ed821d42f9df7',
    messagingSenderId: '752418063958',
    projectId: 'almacen-camion',
    storageBucket: 'almacen-camion.appspot.com',
    iosBundleId: 'com.example.flutterApplicationAlmace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAqrlg_LlnZPbWcZIqGXBRIQrt6yhgCF6w',
    appId: '1:752418063958:web:af5e00d65e2dee282f9df7',
    messagingSenderId: '752418063958',
    projectId: 'almacen-camion',
    authDomain: 'almacen-camion.firebaseapp.com',
    storageBucket: 'almacen-camion.appspot.com',
    measurementId: 'G-TH24J3X1G4',
  );
}