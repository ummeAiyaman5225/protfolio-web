import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    return web;
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmAvajm7VYsefhHfHIsv3bq51z2BRlXd4',
    appId: '1:274553840643:web:805efc7d38a05a672e1a36',
    messagingSenderId: '274553840643',
    projectId: 'protfolio-72',
    authDomain: 'protfolio-72.firebaseapp.com',
    storageBucket: 'protfolio-72.firebasestorage.app',
    measurementId: 'G-JNCWF8QVS7',
  );
}
