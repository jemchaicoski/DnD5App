import 'package:dnd5_app/Utils/customIcons.dart';
import 'package:dnd5_app/components/Logo.dart';
import 'package:dnd5_app/components/MenuButton.dart';
import 'package:dnd5_app/pages/QueryScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Kobold Ancião";
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                const Spacer(),
                IconButton(
                  padding: EdgeInsets.only(right: 20),
                  onPressed: () {
                    setState(() {
                      click = !click;
                    });
                  },
                  icon: Icon(
                    click ? Icons.sunny : CustomIcons.moon,
                  ),
                  alignment: Alignment.topRight,
                  iconSize: 40,
                ),
              ],
            ),
            Column(
              children: [
                const Logo(),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Classes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueryScreen("Classes"),
                        ),
                      );
                    }),
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Raças",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueryScreen("Raças"),
                        ),
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Magias",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueryScreen("Magias"),
                        ),
                      );
                    }),
                MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Talentos",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen("Talentos"),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Características",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueryScreen("Características"),
                        ),
                      );
                    }),
                MenuButton(
                    buttonColor: Colors.red,
                    buttonText: "Equipamentos",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QueryScreen("Equipamentos"),
                        ),
                      );
                    }),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
