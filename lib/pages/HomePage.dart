import 'package:dnd5_app/components/MenuButton.dart';
import 'package:dnd5_app/pages/ListPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home";
  final String title = "Kobold Ancião";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuButton(
                buttonColor: Colors.blueAccent,
                buttonText: "Texto 1",
                onTap: () {}),
            MenuButton(
                buttonColor: Colors.red, buttonText: "Texto 2", onTap: () {}),
            MenuButton(
                buttonColor: Colors.blue, buttonText: "Texto 3", onTap: () {}),
            MenuButton(
                buttonColor: Colors.redAccent,
                buttonText: "Texto 4",
                onTap: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, ListPage.routeName),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
