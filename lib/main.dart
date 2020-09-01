import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';

void main() async{
  runApp(MyApp());

  Firestore.instance.collection('aluno').snapshots().listen((snapshot) {

    for(DocumentSnapshot documento in snapshot.documents){
      print(documento.data);
    }

  });
 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja do Edivaldo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BaseScreen()
    );
  }
}
