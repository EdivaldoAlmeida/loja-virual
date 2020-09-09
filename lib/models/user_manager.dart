import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';

/*
Classe controladora de usuários para autenticação, etc.
 */

class UserManager extends ChangeNotifier {

  //Carregando o user logado ao iniciar a App
  UserManager(){
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  //usuário atual
  FirebaseUser user;

  //Verifica se os dados de login estão sendo carregados no firebase
  bool _loading = false;
  bool get loading => _loading;

  /*
  Essa função recebe um User e duas funções: onFail e onSuccess. onFail retorna
  um código de erro, em caso de falha e onSuccess retorna sucesso.
   */
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {

    loading = true; //Enquanto estiver carregando o loadign é true
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      //Salvando o user atual no login
      this.user = result.user;

      onSuccess();

    }on PlatformException catch (e) {
        onFail(getErrorString(e.code));
    }
    loading = false; //após carregar o login ou falha, loading será false;
  }

  //Salvando um novo usuário com e-mail e password
  Future<void> signUp({User user, Function onFail, Function onSuccess }) async{
    loading = true;

    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      //Recuperando o id do usuário salvo
      user.id = result.user.uid;

      await user.saveData();

      onSuccess();

    }on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

     set loading(bool value){
    _loading = value;
    notifyListeners(); //Informa para todos que estão escutando da mudança
  }

  Future<void>  _loadCurrentUser() async{
   final FirebaseUser currentUser = await auth.currentUser();
    if(currentUser != null){
        user = currentUser;
        print(user.uid); //imprime o uid do user logado
    }
    notifyListeners();
  }
}