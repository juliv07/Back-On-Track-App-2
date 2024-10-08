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
    apiKey: 'AIzaSyBL8U55fH9FcHfZoOysIzlL3gzcwzjyRm0',
    appId: '1:509315938564:web:0007aaa7815fd11999b851',
    messagingSenderId: '509315938564',
    projectId: 'back-on-track-46f4e',
    authDomain: 'back-on-track-46f4e.firebaseapp.com',
    storageBucket: 'back-on-track-46f4e.appspot.com',
    measurementId: 'G-QC1X0P4VP6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1S2t9MWIYYwDYgsjIiLeTxsO-WQzm1qk',
    appId: '1:509315938564:android:8db9ea4e6db41bf099b851',
    messagingSenderId: '509315938564',
    projectId: 'back-on-track-46f4e',
    storageBucket: 'back-on-track-46f4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUv1g0K2iNzbrAJn7ahiCbeQXjMU0bRFM',
    appId: '1:509315938564:ios:ff64a163973ba5c799b851',
    messagingSenderId: '509315938564',
    projectId: 'back-on-track-46f4e',
    storageBucket: 'back-on-track-46f4e.appspot.com',
    iosBundleId: 'com.example.backOnTrackApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUv1g0K2iNzbrAJn7ahiCbeQXjMU0bRFM',
    appId: '1:509315938564:ios:ff64a163973ba5c799b851',
    messagingSenderId: '509315938564',
    projectId: 'back-on-track-46f4e',
    storageBucket: 'back-on-track-46f4e.appspot.com',
    iosBundleId: 'com.example.backOnTrackApp2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBL8U55fH9FcHfZoOysIzlL3gzcwzjyRm0',
    appId: '1:509315938564:web:63e5b22e806d889999b851',
    messagingSenderId: '509315938564',
    projectId: 'back-on-track-46f4e',
    authDomain: 'back-on-track-46f4e.firebaseapp.com',
    storageBucket: 'back-on-track-46f4e.appspot.com',
    measurementId: 'G-VDYKKH5Y5Y',
  );
}
