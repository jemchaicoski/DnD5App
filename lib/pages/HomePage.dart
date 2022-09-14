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
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/3000/3000895.png',
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Classes",
                    onTap: () {}),
                MenuButton(
                    buttonColor: Colors.red, buttonText: "Raças", onTap: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Magias",
                    onTap: () {}),
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Talentos",
                    onTap: () {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Características",
                    onTap: () {}),
                MenuButton(
                    buttonColor: Colors.red, buttonText: "Itens", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
