import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120, bottom: 25),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/icons/dragon.png'),
        backgroundColor: Colors.orange,
        radius: 120,
      ),
    );
  }
}
