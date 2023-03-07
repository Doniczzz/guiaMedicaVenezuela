import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCpOnH5i9H7lDMi_RcD0DD-wi7uQeXpZ1k",
            authDomain: "guia-medica-venezuela-3805a.firebaseapp.com",
            projectId: "guia-medica-venezuela-3805a",
            storageBucket: "guia-medica-venezuela-3805a.appspot.com",
            messagingSenderId: "598566306207",
            appId: "1:598566306207:web:a184ffb2a20a383acd3daa"));
  } else {
    await Firebase.initializeApp();
  }
}
