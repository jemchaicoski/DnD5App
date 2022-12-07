import 'package:dnd5_app/utils/SpellSchools.dart';

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


  String getNameTranslated(){
    String translated = "";
    print(school);
    switch (school) {
      case "Conjuration":
        break;
      case "Necromancy":
        break;
      case "Evocation":
        break;
      case "Abjuration":
        break;
      case "Transmutation":
        break;
      case "Divination":
        break;
      case "Enchantment":
        break;
      case "Illusion":
        translated = Ilusion.map[name]!;
        break;
    }
  return translated;
  }

  String getClasses(){
    String classesString = "";
    for(var c in classes!){
      classesString += c + " ";
    }
    return classesString;
  }

  String getComponents(){
    String componentsString = "";
    for(var c in components!){
      componentsString += c + " ";
    }
    return componentsString;
  }

  String getTypeAndLevel(){
    if(level == 0){
      return school! + " de " + level.toString() + " nível";
    }

    return school! + " de " + level.toString() + "° nível";
  }


  String getHigherLevel(){
    String higherLevelString = "";
    for(var c in higherLevel!){
      higherLevelString += c + " ";
    }

    if(higherLevelString != ""){
      return "Em níveis superiores: " + higherLevelString;
    }

    return "";
  }
}


