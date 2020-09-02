import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart';
import 'package:loja_virtual/screens/base/base_screen.dart';

void main() async{
  runApp(MyApp());

 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja do Edivaldo',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 4, 125, 141),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
        appBarTheme: const AppBarTheme(
          elevation: 0
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BaseScreen()
    );
  }
}
