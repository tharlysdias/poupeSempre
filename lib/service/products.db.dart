/* // Utilizando dados do banco
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poupe_sempre/layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poupe Sempre!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyHomePage(title: "Poupe Sempre"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                    title: Text(doc.data["title"]),
                    subtitle: Text(doc.data["description"]),
                  );
                }).toList(),
              ),
            );
        }
      },
    );

    return Layout.render(content);
  }
}
 */
