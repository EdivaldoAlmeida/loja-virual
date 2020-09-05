import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

/*
Classe controladora de usuários para autenticação, etc.
 */

class UserMaganager {

  final FirebaseAuth auth = FirebaseAuth.instance;

  /*
  Essa função recebe um User e duas funções: onFail e onSuccess. onFail retorna
  um código de erro, em caso de falha e onSuccess retorna sucesso.
   */
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    //Retorna se foi sucesso ou não.

    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      onSuccess();

    }on PlatformException catch (e) {
        onFail(getErrorString(e.code));
    }
  }
}