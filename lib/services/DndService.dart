import 'dart:convert';
import 'package:dnd5_app/models/Spell.dart';
import 'package:dnd5_app/utils/SpellSchools.dart';
import 'package:http/http.dart' as http;
import '../models/Generic.dart';
import 'package:translator/translator.dart';

class DndService {
  GoogleTranslator translator = new GoogleTranslator();
  final String defaultString = "https://www.dnd5eapi.co/api/spells/";

  getListOfNamesFilteredBySpellType(String queryFilter) async {
    var data = await http.get(Uri.parse(defaultString));
    var jsonData = json.decode(data.body);

    List<Generic> listOfGeneric = [];

    if (queryFilter == "abjuration") {
      for (var u in jsonData["results"]) {
        if (Abjuration.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "transmutation") {
      for (var u in jsonData["results"]) {
        if (Transmutation.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "conjuration") {
      for (var u in jsonData["results"]) {
        if (Conjuration.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "divination") {
      for (var u in jsonData["results"]) {
        if (Divination.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "enchantment") {
      for (var u in jsonData["results"]) {
        if (Enchantment.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "evocation") {
      for (var u in jsonData["results"]) {
        if (Evocation.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "necromancy") {
      for (var u in jsonData["results"]) {
        if (Necromancy.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    if (queryFilter == "ilusion") {
      for (var u in jsonData["results"]) {
        if (Ilusion.list.contains(u["name"])) {
          Generic generic = Generic(u["name"], u["index"]);
          listOfGeneric.add(generic);
        }
      }
    }

    return listOfGeneric;
  }

  Future<Spell> getOneSpell(String itemKey) async {
    var data = await http.get(Uri.parse(defaultString + itemKey));
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
        classes: classes);

    //print(spell.toString());
    
    var translationDesc = await translator.translate(spell.desc, from: 'en', to: 'pt');
    spell.desc = translationDesc.text;

    if(spell.higherLevel!.isNotEmpty){
      var translationHigherLevel = await translator.translate(spell.higherLevel![0], from: 'en', to: 'pt');
      spell.higherLevel![0] = translationHigherLevel.text;
    }

    var translationName = await translator.translate(spell.name!, from: 'en', to: 'pt');
    spell.name = translationName.text;

    return spell;
  }
}
