import 'package:dnd5_app/utils/Translation.dart';

class Spell {
  String? name;
  String desc;
  List<String>? higherLevel;
  String? range;
  List<String>? components;
  String? material;
  bool? ritual;
  String? duration;
  bool? concentration;
  String? castingTime;
  int? level;
  String? school;
  List<String>? classes;

  Spell({
    this.name,
    required this.desc,
    this.higherLevel = const [""],
    this.range,
    this.components,
    this.material,
    this.ritual,
    this.duration,
    this.concentration,
    this.castingTime,
    this.level,
    this.school,
    this.classes,
  });

  @override
  String toString() {
    return 'Spell{name: $name, '
        '\ndesc: $desc, '
        '\nhigherLevel: $higherLevel, '
        '\nrange: $range, '
        '\ncomponents: $components, '
        '\nmaterial: $material, '
        '\nritual: $ritual, '
        '\nduration: $duration, '
        '\nconcentration: $concentration, '
        '\ncastingTime: $castingTime, '
        '\nlevel: $level, '
        '\nschool: $school, '
        '\nclasses: $classes, '
        '}';
  }

  String getNameTranslated() {
    String translated = "";
    print(school);
    switch (school) {
      case "Conjuration":
        translated = Conjuration.map[name]!;
        break;
      case "Necromancy":
        translated = Necromancy.map[name]!;
        break;
      case "Evocation":
        translated = Evocation.map[name]!;
        break;
      case "Abjuration":
        translated = Abjuration.map[name]!;
        break;
      case "Transmutation":
        translated = Transmutation.map[name]!;
        break;
      case "Divination":
        translated = Divination.map[name]!;
        break;
      case "Enchantment":
        translated = Enchantment.map[name]!;
        break;
      case "Illusion":
        translated = Ilusion.map[name]!;
        break;
    }
    return translated;
  }

  String getClassesTranslated() {
    String classesString = "";
    for (var c in classes!) {
      classesString += Classes.map[c]! + " ";
    }
    return classesString;
  }

  String getRange(){
    if(range == "Touch"){
      return "Toque";
    }
   return range!;
  }

  String getComponents() {
    String componentsString = "";
    for (var c in components!) {
      componentsString += c + " ";
    }
    return componentsString;
  }

  String getTypeAndLevel() {
    if (level == 0) {
      return SpellSchools.map[school!]! + " de " + level.toString() + " n??vel";
    }

    return SpellSchools.map[school!]! + " de " + level.toString() + "?? n??vel";
  }

  String getHigherLevel() {
    String higherLevelString = "";
    for (var c in higherLevel!) {
      higherLevelString += c + " ";
    }

    if (higherLevelString != "") {
      return "Em n??veis superiores: " + higherLevelString;
    }

    return "";
  }
}
