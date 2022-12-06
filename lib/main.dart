import 'package:dnd5_app/pages/HomePage.dart';
import 'package:dnd5_app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kobold Ancião',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Roboto",
      ),
      home: const HomePage(),
      routes: routes,
    );
  }
}
