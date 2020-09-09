import 'package:cloud_firestore/cloud_firestore.dart';

/*
Classe modelo de usuários
 */

class User{
  User({this.email, this.password, this.name, this.id});

    String id;
    String name;
    String email;
    String password;
    String confirmPassword;


    //Criando uma referência para o id do usuário
    DocumentReference get firestoreRef =>
    Firestore.instance.document('users/$id');

    //Salva os dados (nome e e-mail) do usuário no Firebase.
  Future<void> saveData() async{
    await firestoreRef.setData(toMap());

  }

  //Maneiro mais elegante de salvar os dados no firebase, abravés de map
  Map<String, dynamic> toMap(){
      return{
        'name' : name,
        'email' : email,
      };
  }
}