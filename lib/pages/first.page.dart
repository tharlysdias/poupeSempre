import 'package:flutter/material.dart';
import 'package:poupe_sempre/pages/list.products.page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Página de Login'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ListagemProdutos()));
                },
                child: Text("Listagem de Produtos")),
          ),
        ));
  }
}
