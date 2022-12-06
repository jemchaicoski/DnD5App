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

  static const double spaceBetweenButtons = 15.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
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
              const SizedBox(
                width: 20,
              ),
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
                alignment: Alignment.bottomRight,
                iconSize: 40,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Conjuração",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen("Classes"),
                      ),
                    );
                  }),
              const SizedBox(
                width: spaceBetweenButtons,
              ),
              MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Necromancia",
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
                  buttonText: "Evocação",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen("Magias"),
                      ),
                    );
                  }),
              const SizedBox(
                width: spaceBetweenButtons,
              ),
              MenuButton(
                buttonColor: Colors.red,
                buttonText: "Abjuração",
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
                  buttonText: "Transmutação",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen("Características"),
                      ),
                    );
                  }),
              const SizedBox(
                width: spaceBetweenButtons,
              ),
              MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Adivinhação",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Encantamento ",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QueryScreen("Características"),
                      ),
                    );
                  }),
              const SizedBox(
                width: spaceBetweenButtons,
              ),
              MenuButton(
                  buttonColor: Colors.red,
                  buttonText: "Ilusão",
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
        ],
      ),
    );
  }
}
