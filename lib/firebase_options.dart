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
    apiKey: 'AIzaSyAw8EFBPgXP_96Xm9-Fdq8La07m_HMJ29Y',
    appId: '1:828455135304:web:a6a3e616c0baae5630907d',
    messagingSenderId: '828455135304',
    projectId: 'netflix-90cd1',
    authDomain: 'netflix-90cd1.firebaseapp.com',
    storageBucket: 'netflix-90cd1.appspot.com',
    measurementId: 'G-FRX8J1XC5D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFPS21dsJYq4e5X19lEeKz5HKFSPC50YE',
    appId: '1:828455135304:android:430bb40b793ac78e30907d',
    messagingSenderId: '828455135304',
    projectId: 'netflix-90cd1',
    storageBucket: 'netflix-90cd1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6wIjYyajC2il2DrRlWyWBnhyVC7-OhCM',
    appId: '1:828455135304:ios:4a476ceaf3ae983c30907d',
    messagingSenderId: '828455135304',
    projectId: 'netflix-90cd1',
    storageBucket: 'netflix-90cd1.appspot.com',
    iosBundleId: 'com.example.netflixApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6wIjYyajC2il2DrRlWyWBnhyVC7-OhCM',
    appId: '1:828455135304:ios:4a476ceaf3ae983c30907d',
    messagingSenderId: '828455135304',
    projectId: 'netflix-90cd1',
    storageBucket: 'netflix-90cd1.appspot.com',
    iosBundleId: 'com.example.netflixApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAw8EFBPgXP_96Xm9-Fdq8La07m_HMJ29Y',
    appId: '1:828455135304:web:cacb16ac0ec8449c30907d',
    messagingSenderId: '828455135304',
    projectId: 'netflix-90cd1',
    authDomain: 'netflix-90cd1.firebaseapp.com',
    storageBucket: 'netflix-90cd1.appspot.com',
    measurementId: 'G-SKLRH7V1FB',
  );

}