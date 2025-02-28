import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDuS-TBuNkbzvebwnHmG-anBkqkPtQLI2c",
            authDomain: "event-management-app-19995.firebaseapp.com",
            projectId: "event-management-app-19995",
            storageBucket: "event-management-app-19995.appspot.com",
            messagingSenderId: "200549685379",
            appId: "1:200549685379:web:b0b31295e5f05f7ca923b6",
            measurementId: "G-ZGV66PWWZ1"));
  } else {
    await Firebase.initializeApp();
  }
}
