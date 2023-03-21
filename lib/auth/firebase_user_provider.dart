import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SeProjectFirebaseUser {
  SeProjectFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SeProjectFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SeProjectFirebaseUser> seProjectFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SeProjectFirebaseUser>(
      (user) {
        currentUser = SeProjectFirebaseUser(user);
        return currentUser!;
      },
    );
