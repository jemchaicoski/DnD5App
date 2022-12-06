import 'package:dnd5_app/pages/informationScreens/SpellInformationScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../services/DndService.dart';
import '../utils/queryNameEnum.dart';

class QueryScreen extends StatefulWidget {
  final String title;
  const QueryScreen(this.title);

  @override
  _QueryScreenState createState() => new _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  DndService dndService = DndService();
  late Future<List<dynamic>> course;

  void initState() {
    super.initState();
    course = _getThingsOnStartup();
  }

  Future<List<dynamic>> _getThingsOnStartup() async {
    var result;
    switch (widget.title) {
      case "Classes":
        result = await dndService.getListOfNames(QueryName.classes.name);
        break;
      case "Raças":
        result = await dndService.getListOfNames(QueryName.races.name);
        break;
      case "Magias":
        result = await dndService.getListOfNames(QueryName.spells.name);
        break;
      case "Talentos":
        result = await dndService.getListOfNames(QueryName.features.name);
        break;
      case "Características":
        result = await dndService.getListOfNames(QueryName.traits.name);
        break;
      case "Equipamentos":
        result = await dndService.getListOfNames(QueryName.equipment.name);
        break;
    }
    return result;
  }

  _getInfoScreen(String index) {
    switch (widget.title) {
      case "Classes":
        // result = await dndService.getListOfNames(QueryName.classes.name);
        break;
      case "Raças":
        //result = await dndService.getListOfNames(QueryName.races.name);
        break;
      case "Magias":
        return SpellInformationScreen(index);
        break;
      case "Talentos":
        //result = await dndService.getListOfNames(QueryName.features.name);
        break;
      case "Características":
        //result = await dndService.getListOfNames(QueryName.traits.name);
        break;
      case "Equipamentos":
        //result = await dndService.getListOfNames(QueryName.equipment.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: FutureBuilder(
          future: course,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: const Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].name,
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFF212121),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  _getInfoScreen(snapshot.data[index].index)));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
