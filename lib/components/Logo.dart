import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 0, bottom: 25),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/icons/dragon.png'),
        backgroundColor: Color.fromRGBO(237, 182, 16, 1),
        radius: 100,
      ),
    );
  }
}
