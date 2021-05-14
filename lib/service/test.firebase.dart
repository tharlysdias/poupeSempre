/* import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListagemProdutos extends StatelessWidget {
  List<DocumentSnapshot> listSnapshot = List();
  Future getProdutos() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("Produtos").getDocuments();
    listSnapshot = qn.documents;
    return listSnapshot;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      getProdutos();
    }

    // Debug teste da aplicação
    floatingActionButton:
    FloatingActionButton.extended(
      onPressed: () {
        getProdutos();
      },
      label: Text(
        "Próximo",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
      icon: Icon(Icons.navigate_next, size: 40),
      backgroundColor: Colors.deepOrange,
    );
  }
} */
