import 'package:flutter/material.dart';
import 'package:poupe_sempre/layout.dart';
import 'package:poupe_sempre/pages/detalhes_produtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListagemProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget content = StreamBuilder(
      stream: Firestore.instance.collection("produtos").snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return LinearProgressIndicator();
            break;
          default:
            return Center(
              child: ListView(
                children:
                    snapshot.data.documents.map<Widget>((DocumentSnapshot doc) {
                  return ListTile(
                    leading: Icon(Icons.add_shopping_cart, size: 52),
                    title: Text(
                        "${doc.data["title"]} - Quantidade: ${doc.data["qtd"].toString()}"),
                    subtitle: Text(doc.data["description"]),
                  );
                }).toList(),
              ),
            );
        }
      },
    );
    // Tela de apresentação dos produtos
    return Layout.render(content);

    final title = "Listagem de Produtos";
    List choices = const [
      const Choice(
          title: 'Chocoleite - R\$ 7,99',
          qtd: 'Quantidade: 42',
          description:
              'Esse Chocoleite é mágico. Possui fragrâncias de cacau com pequenos pedaços de chocolate ao leite.',
          imglink:
              'https://www.grupoodp.com.br/temnoticia/wp-content/uploads/Foto_002-2013%20(For%C3%A7a%20animal).jpg'),
      const Choice(
          title: 'Macarrão médio furadinho - R\$5,00',
          qtd: 'Quantidade: 50',
          description:
              'Sêmola de trigo enriquecido com ferro e ácido fólico,ovos integrais desidratados, óleo vegetal, corantes naturais de urucum e cúruma. Contém glúten.',
          imglink:
              'https://www.agendadascidades.com.br/uploads/images/2020/04/macarrao-furadinho-medio-vitamassa-500g.png'),
      const Choice(
          title: 'Queijo Coalho Crioulo Espeto - R\$6,50',
          qtd: 'Quantidade: 38',
          description: 'Queijo da vaca',
          imglink:
              'https://lh3.googleusercontent.com/proxy/_7Fp6-oriYA5nTSf39oSXxX6GSJ5PaVoXr__4PMTh5oyu13FUOr52V3hzmMDfvErsQpTHj3chhztv4R3TtmxpFPlHV1B_wGStQ9HobFaBwb-zbUdqfhEHgW6oTYSkawF5raD'),
      const Choice(
          title: 'Maionese Hellmans - R\$10,00',
          qtd: 'Quantidade: 37',
          description:
              'A Maionese Hellmanns Tradicional 500g É Perfeita Para Deixar Seus Sanduíches, Assados, Massas, Patês E Saladas Com Um Toque Todo Especial. Você Vai Incrementar Suas Receitas, Preparar Pratos Deliciosos E Agradar Toda A Sua Família Com A Verdadeira Maionese.',
          imglink:
              'https://www.hellmanns.pt/Images/3423/3423-1319731-NOVA_3423-1105687-teaser_product%20HellmannsPacks_378x253px.png'),
      const Choice(
          title: 'Wafer Marilan - R\$3,00',
          qtd: 'Quantidade: 60',
          description:
              'São três camadas de casquinhas finas e crocantes com recheio cremoso nas opções: Chocolate, Morango, Limão, Maracujá, Bauny, Chocolate Suíço e Brigadeiro.',
          imglink:
              'https://www.marilan.com/wp-content/uploads/2018/10/wafer-chocolate.png'),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.deepPurple,
        ),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: List.generate(
            choices.length,
            (index) {
              return Center(
                child: ChoiceCard(choice: choices[index], item: choices[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Choice {
  final String title;
  final String qtd;
  final String description;
  final String imglink;

  const Choice({this.title, this.qtd, this.description, this.imglink});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key,
      this.choice,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final Choice choice;

  final VoidCallback onTap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
      color: Colors.white,
      child: Column(
        children: [
          new Container(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(choice.imglink)),
          new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(choice.title, style: Theme.of(context).textTheme.title),
                Text(choice.qtd,
                    style: TextStyle(color: Colors.black.withOpacity(0.5))),
                Text(choice.description),
                RaisedButton(
                  onPressed: () {},
                  child: const Text('Mais detalhes',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
