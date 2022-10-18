import 'package:dnd5_app/services/DndService.dart';
import 'package:flutter/material.dart';

class QueryScreen extends StatefulWidget{
  final String title;
  const QueryScreen(this.title);

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  DndService dndService = DndService();

  @override
  void initState() {
    _getThingsOnStartup().then((value){
      print('Async done');
    });
    super.initState();
  }

  Future _getThingsOnStartup() async {
    await dndService.getAllSpells();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
  }
}
