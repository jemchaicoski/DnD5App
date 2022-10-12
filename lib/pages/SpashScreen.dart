import 'package:dnd5_app/components/Logo.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Logo(),
        Text(
          "Kobolt Ancião",
          style: TextStyle(fontSize: 40, fontFamily: "Georgia"),
        ),
      ],
    );
  }
}
