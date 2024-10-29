import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAkcvaaYrIvFscP9SUsbdtFKMfDVPCtv7Q",
            authDomain: "expense-splitter-x5qugv.firebaseapp.com",
            projectId: "expense-splitter-x5qugv",
            storageBucket: "expense-splitter-x5qugv.appspot.com",
            messagingSenderId: "1000357492327",
            appId: "1:1000357492327:web:4235aee92d91ac7c9f86c2"));
  } else {
    await Firebase.initializeApp();
  }
}
