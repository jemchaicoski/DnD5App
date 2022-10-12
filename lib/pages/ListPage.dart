import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({required this.title, Key? key}) : super(key: key);
  static String routeName = "/List";
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
