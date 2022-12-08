import 'package:flutter/material.dart';
import 'package:dnd5_app/Utils/customIcons.dart';
import 'package:dnd5_app/components/Logo.dart';
import 'package:dnd5_app/components/MenuButton.dart';
import 'package:dnd5_app/pages/SpellListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

final String title = "Kobold Ancião";
bool _iconBool = true;
const double spaceBetweenButtons = 15.0;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  brightness: Brightness.dark,
  indicatorColor: Colors.white,
  textTheme: TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
  ),
);

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kobold Ancião',
      theme: _iconBool ? _lightTheme : _darkTheme,
      home: Builder(
        builder: (BuildContext context) {return Scaffold(
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
                          fontSize: 32,
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
                        _iconBool = !_iconBool;
                      });
                    },
                    icon: Icon(
                      _iconBool ? Icons.sunny : CustomIcons.moon,
                    ),
                    alignment: Alignment.bottomRight,
                    iconSize: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(
                      buttonText: "Conjuração",
                      isDarkMode: _iconBool,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Conjuração", _iconBool),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: spaceBetweenButtons,
                  ),
                  MenuButton(
                      isDarkMode: _iconBool,
                      buttonText: "Necromancia",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Necromancia", _iconBool),
                          ),
                        );
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(
                      isDarkMode: _iconBool,
                      buttonText: "Evocação",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Evocação", _iconBool),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: spaceBetweenButtons,
                  ),
                  MenuButton(
                    isDarkMode: _iconBool,
                    buttonText: "Abjuração",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpellListScreen("Abjuração", _iconBool),
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
                      isDarkMode: _iconBool,
                      buttonText: "Transmutação",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Transmutação", _iconBool),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: spaceBetweenButtons,
                  ),
                  MenuButton(
                      isDarkMode: _iconBool,
                      buttonText: "Adivinhação",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Adivinhação", _iconBool),
                          ),
                        );
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(
                      isDarkMode: _iconBool,
                      buttonText: "Encantamento",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Encantamento", _iconBool),
                          ),
                        );
                      }),
                  const SizedBox(
                    width: spaceBetweenButtons,
                  ),
                  MenuButton(
                      isDarkMode: _iconBool,
                      buttonText: "Ilusão",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpellListScreen("Ilusão", _iconBool),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        );},
      ),
    );
  }
}
