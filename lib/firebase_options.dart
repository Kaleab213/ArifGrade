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
    apiKey: 'AIzaSyCRUKr6-vvQESxniAVoPvIbytAc-PswQhA',
    appId: '1:1094296850064:web:711fda90bf924e16dd1215',
    messagingSenderId: '1094296850064',
    projectId: 'study-app-a0a74',
    authDomain: 'study-app-a0a74.firebaseapp.com',
    storageBucket: 'study-app-a0a74.appspot.com',
    measurementId: 'G-BK5HW7VK9E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBK7beKw5S6LaNIcv4SZLYrmPPVuXTigmY',
    appId: '1:1094296850064:android:f4c5e2f6c3b565a0dd1215',
    messagingSenderId: '1094296850064',
    projectId: 'study-app-a0a74',
    storageBucket: 'study-app-a0a74.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-q1blHrjINrmjs1--_9qW9Vx_eqmNlkI',
    appId: '1:1094296850064:ios:8f3a9a5b7957bd1fdd1215',
    messagingSenderId: '1094296850064',
    projectId: 'study-app-a0a74',
    storageBucket: 'study-app-a0a74.appspot.com',
    iosClientId: '1094296850064-p08ihnq3s6l1d7rp0iefcb03t0maf20i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterStudyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-q1blHrjINrmjs1--_9qW9Vx_eqmNlkI',
    appId: '1:1094296850064:ios:ea5d5b4081ee8581dd1215',
    messagingSenderId: '1094296850064',
    projectId: 'study-app-a0a74',
    storageBucket: 'study-app-a0a74.appspot.com',
    iosClientId: '1094296850064-7ogdmvk1slke39gia2gt9itlqqi27emb.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterStudyApp.RunnerTests',
  );
}
