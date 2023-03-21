import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCe5Rnf4gepKKWB74XXcTPQoMk6OPRocSU",
            authDomain: "fir-test-a9c25.firebaseapp.com",
            projectId: "fir-test-a9c25",
            storageBucket: "fir-test-a9c25.appspot.com",
            messagingSenderId: "487153437449",
            appId: "1:487153437449:web:63f061d680704d8a79e1d8"));
  } else {
    await Firebase.initializeApp();
  }
}
