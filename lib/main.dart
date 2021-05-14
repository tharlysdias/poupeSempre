import 'package:flutter/material.dart';
import 'package:poupe_sempre/pages/login.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
  // inserir dados no banco de dados
  Firestore.instance.collection("test").document("document").setData(
      {"Texto": "foi aqui", "Numero": 030296, "Deu certo": true},
      merge: true);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poupe Sempre!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}
