import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/models/user.dart';

/*
Classe controladora de usuários para autenticação, etc.
 */

class UserMaganager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(User user) async {
    //Retorna se foi sucesso ou não.

    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);

    }on PlatformException catch (e) {
        print(e);
    }
  }
}