import 'package:flutter/material.dart';

class QueryScreen extends StatelessWidget {
  final String title;
  const QueryScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("List Item $index"),
          );
        },
      ),
    );
    ;
  }
}
