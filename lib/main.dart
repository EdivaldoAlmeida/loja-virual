import 'package:flutter/material.dart';
import 'package:charcode/html_entity.dart';

void main() {
  runApp(MyApp());
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
      home: Container(
        child: Column(
          children: [
            AppBar(
              title: Text("Loja virtual Edivaldo"),
            ),

          ],
        ),
      )
    );
  }
}
