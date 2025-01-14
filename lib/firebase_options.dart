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
        return macos;
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
    apiKey: 'AIzaSyBTQZR0rS2Wg-YLllS9buG1tLGxFAIvJmo',
    appId: '1:1035937955263:web:371b2a46ebe26d90d4f50a',
    messagingSenderId: '1035937955263',
    projectId: 'social-flutter-c137a',
    authDomain: 'social-flutter-c137a.firebaseapp.com',
    storageBucket: 'social-flutter-c137a.appspot.com',
    measurementId: 'G-YTWT6EC4KB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBX3QFvVkGO-rcSsBrvC7Qu4T4NpN56t00',
    appId: '1:1035937955263:android:07cbfa0901fb5c7dd4f50a',
    messagingSenderId: '1035937955263',
    projectId: 'social-flutter-c137a',
    storageBucket: 'social-flutter-c137a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQJUqzUDtRcBkrYjXBZpkkeZMIF8_yXdU',
    appId: '1:1035937955263:ios:7e05ecf5f9218b27d4f50a',
    messagingSenderId: '1035937955263',
    projectId: 'social-flutter-c137a',
    storageBucket: 'social-flutter-c137a.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQJUqzUDtRcBkrYjXBZpkkeZMIF8_yXdU',
    appId: '1:1035937955263:ios:7e05ecf5f9218b27d4f50a',
    messagingSenderId: '1035937955263',
    projectId: 'social-flutter-c137a',
    storageBucket: 'social-flutter-c137a.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBTQZR0rS2Wg-YLllS9buG1tLGxFAIvJmo',
    appId: '1:1035937955263:web:c8cd17831270d256d4f50a',
    messagingSenderId: '1035937955263',
    projectId: 'social-flutter-c137a',
    authDomain: 'social-flutter-c137a.firebaseapp.com',
    storageBucket: 'social-flutter-c137a.appspot.com',
    measurementId: 'G-77BDSPQ8LK',
  );
}
