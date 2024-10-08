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
    apiKey: 'AIzaSyBVbiJcA8BGaRn1ZqzBgTmsO1tD3uVCvnE',
    appId: '1:228971898333:web:a3706ab0cc7718fccdc234',
    messagingSenderId: '228971898333',
    projectId: 'spotifyclonemadebysumit',
    authDomain: 'spotifyclonemadebysumit.firebaseapp.com',
    storageBucket: 'spotifyclonemadebysumit.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBIdvSRts7W32-O_QzwHSnJwRtVoLQoyRI',
    appId: '1:228971898333:android:46d67a7b6491e092cdc234',
    messagingSenderId: '228971898333',
    projectId: 'spotifyclonemadebysumit',
    storageBucket: 'spotifyclonemadebysumit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuJMGGCA-G60sd_tAaGKLQ9BjjNfrHv84',
    appId: '1:228971898333:ios:175ed437e584c172cdc234',
    messagingSenderId: '228971898333',
    projectId: 'spotifyclonemadebysumit',
    storageBucket: 'spotifyclonemadebysumit.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuJMGGCA-G60sd_tAaGKLQ9BjjNfrHv84',
    appId: '1:228971898333:ios:175ed437e584c172cdc234',
    messagingSenderId: '228971898333',
    projectId: 'spotifyclonemadebysumit',
    storageBucket: 'spotifyclonemadebysumit.appspot.com',
    iosBundleId: 'com.example.spotifyClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBVbiJcA8BGaRn1ZqzBgTmsO1tD3uVCvnE',
    appId: '1:228971898333:web:7f9651e6d93c5007cdc234',
    messagingSenderId: '228971898333',
    projectId: 'spotifyclonemadebysumit',
    authDomain: 'spotifyclonemadebysumit.firebaseapp.com',
    storageBucket: 'spotifyclonemadebysumit.appspot.com',
  );
}
