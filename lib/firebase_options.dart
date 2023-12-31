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
    apiKey: 'AIzaSyDbBW_aEp5S1dzhy1NvZnTInMFg0ROJ4lo',
    appId: '1:1065316389789:web:8560c6507023e9a316d574',
    messagingSenderId: '1065316389789',
    projectId: 'note-app-20c28',
    authDomain: 'note-app-20c28.firebaseapp.com',
    storageBucket: 'note-app-20c28.appspot.com',
    measurementId: 'G-JTLVNHPR0C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBahJdyDzWvbxyNWoFtBzxlvlEwK8TV02I',
    appId: '1:1065316389789:android:5a28fe71f62f771b16d574',
    messagingSenderId: '1065316389789',
    projectId: 'note-app-20c28',
    storageBucket: 'note-app-20c28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-v4ukroOy4L2K0rC9kJ_rRlETb3t6z4w',
    appId: '1:1065316389789:ios:4f4d854e853fc9ae16d574',
    messagingSenderId: '1065316389789',
    projectId: 'note-app-20c28',
    storageBucket: 'note-app-20c28.appspot.com',
    iosClientId: '1065316389789-iq0tq174vci1k1sgs6p30pcmr2t7h9dn.apps.googleusercontent.com',
    iosBundleId: 'com.example.note',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-v4ukroOy4L2K0rC9kJ_rRlETb3t6z4w',
    appId: '1:1065316389789:ios:56cd857ef9431f1c16d574',
    messagingSenderId: '1065316389789',
    projectId: 'note-app-20c28',
    storageBucket: 'note-app-20c28.appspot.com',
    iosClientId: '1065316389789-ap7fvciq9r3ps5rahmhpqu8slbvn8uq6.apps.googleusercontent.com',
    iosBundleId: 'com.example.note.RunnerTests',
  );
}
