class Spell {
  String? name;
  String? desc;
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
    this.desc,
    this.higherLevel,
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


