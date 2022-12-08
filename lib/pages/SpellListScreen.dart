import 'package:dnd5_app/pages/SpellInformationScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../services/DndService.dart';

class SpellListScreen extends StatefulWidget {
  final String title;
  final bool isDarkMode;

  const SpellListScreen(this.title, this.isDarkMode);

  @override
  _SpellListScreenState createState() => new _SpellListScreenState();
}

Color getTextColorByTheme(bool isDarkMode){
    if (isDarkMode){
      return Colors.black;
    }
    return Colors.white;
}

class _SpellListScreenState extends State<SpellListScreen> {
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
        result =
            await dndService.getListOfNamesFilteredBySpellType("conjuration");
        break;
      case "Necromancia":
        result =
            await dndService.getListOfNamesFilteredBySpellType("necromancy");
        break;
      case "Evocação":
        result =
            await dndService.getListOfNamesFilteredBySpellType("evocation");
        break;
      case "Abjuração":
        result =
            await dndService.getListOfNamesFilteredBySpellType("abjuration");
        break;
      case "Transmutação":
        result =
            await dndService.getListOfNamesFilteredBySpellType("transmutation");
        break;
      case "Adivinhação":
        result =
            await dndService.getListOfNamesFilteredBySpellType("divination");
        break;
      case "Encantamento":
        result =
            await dndService.getListOfNamesFilteredBySpellType("enchantment");
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
      ),
      body: FutureBuilder(
        future: course,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: Text("Loading..."));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    snapshot.data[index].name,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                      color: getTextColorByTheme(widget.isDarkMode),
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
    );
  }
}
