import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAjxTCKk_0NoScuOYDK-5xYAYlmAhVdpTY",
            authDomain: "stock-535b8.firebaseapp.com",
            projectId: "stock-535b8",
            storageBucket: "stock-535b8.appspot.com",
            messagingSenderId: "590481859199",
            appId: "1:590481859199:web:fa19ced9110113c83dd54a",
            measurementId: "G-RWBTSZMHQY"));
  } else {
    await Firebase.initializeApp();
  }
}
