import 'dart:convert';
import 'package:dnd5_app/models/Spell.dart';
import 'package:http/http.dart' as http;
import '../models/Generic.dart';

class DndService {
  final String defaultString = "https://www.dnd5eapi.co/api/";

  getListOfNames(String queryName) async {
    var data =
        await http.get(Uri.parse("https://www.dnd5eapi.co/api/" + queryName));
    var jsonData = json.decode(data.body);

    List<Generic> listOfGeneric = [];

    for (var u in jsonData["results"]) {
      Generic generic = Generic(u["name"], u["index"]);
      listOfGeneric.add(generic);
    }

    return listOfGeneric;
  }

  Future<Spell> getOneSpell(String itemKey) async {
    var data = await http.get(Uri.parse(defaultString + "spells/" + itemKey));
    var jsonData = json.decode(data.body);

    List<String> classes = [];
    List<String> higherLevelList = [];
    List<String> components = [];

    for (var u in jsonData["classes"]) {
      classes.add(u["name"]);
    }

    for (var u in jsonData["higher_level"]) {
      higherLevelList.add(u);
    }

    for (var u in jsonData["components"]) {
      components.add(u);
    }

    Spell spell = Spell(
      name: jsonData["name"],
      desc: jsonData["desc"][0],
      higherLevel: higherLevelList,
      components: components,
      material: jsonData["material"],
      range: jsonData["range"],
      concentration: jsonData["concentration"],
      duration: jsonData["duration"],
      ritual: jsonData["ritual"],
      castingTime: jsonData["casting_time"],
      level: jsonData["level"],
      school: jsonData["school"]["name"],
      classes:  classes
    );

    //print(spell.toString());

    return spell;
  }
}
