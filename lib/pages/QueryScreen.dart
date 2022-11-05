import 'package:dnd5_app/models/Feature.dart';
import 'package:dnd5_app/services/DndService.dart';
import 'package:dnd5_app/utils/queryNameEnum.dart';
import 'package:flutter/material.dart';

class QueryScreen extends StatefulWidget {
  final String title;
  const QueryScreen(this.title);

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  DndService dndService = DndService();

  @override
  void initState() {
    _getThingsOnStartup().then((value) {});
    super.initState();
  }

  Future _getThingsOnStartup() async {
    switch (widget.title) {
      case "Classes":
        await dndService.getList(QueryName.classes.name);
        break;
      case "Raças":
        await dndService.getList(QueryName.races.name);
        break;
      case "Magias":
        await dndService.getList(QueryName.spells.name);
        break;
      case "Talentos":
        await dndService.getList(QueryName.features.name);
        break;
      case "Características":
        await dndService.getList(QueryName.traits.name);
        break;
      case "Equipamentos":
        await dndService.getList(QueryName.equipment.name);
        break;
    }
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
            title: Text(""),
          );
        },
      ),
    );
  }
}
