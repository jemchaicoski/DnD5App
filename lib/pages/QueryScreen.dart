import 'package:dnd5_app/pages/informationScreens/SpellInformationScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../services/DndService.dart';

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
      case "Conjuração":
        result = await dndService.getListOfNamesFilteredBySpellType("conjuration");
        break;
      case "Necromancia":
        result = await dndService.getListOfNamesFilteredBySpellType("necromancy");
        break;
      case "Evocação":
        result = await dndService.getListOfNamesFilteredBySpellType("evocation");
        break;
      case "Abjuração":
        result = await dndService.getListOfNamesFilteredBySpellType("abjuration");
        break;
      case "Transmutação":
        result = await dndService.getListOfNamesFilteredBySpellType("transmutation");
        break;
      case "Adivinhação":
        result = await dndService.getListOfNamesFilteredBySpellType("divination");
        break;
      case "Encantamento":
        result = await dndService.getListOfNamesFilteredBySpellType("enchantment");
        break;
      case "Ilusão":
        result = await dndService.getListOfNamesFilteredBySpellType("ilusion");
        break;
    }
    return result;
  }

  _getInfoScreen(String index) {
    return SpellInformationScreen(index);
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
