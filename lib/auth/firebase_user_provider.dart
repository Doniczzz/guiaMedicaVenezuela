import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GuiaMedicaVenezuelaFirebaseUser {
  GuiaMedicaVenezuelaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GuiaMedicaVenezuelaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GuiaMedicaVenezuelaFirebaseUser>
    guiaMedicaVenezuelaFirebaseUserStream() => FirebaseAuth.instance
            .authStateChanges()
            .debounce((user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user))
            .map<GuiaMedicaVenezuelaFirebaseUser>(
          (user) {
            currentUser = GuiaMedicaVenezuelaFirebaseUser(user);
            return currentUser!;
          },
        );
