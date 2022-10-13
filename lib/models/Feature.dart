class Feature {
  String? index;
  String? name;
  List<Prerequisites>? prerequisites;
  List<String>? desc;
  String? url;

  Feature({this.index, this.name, this.prerequisites, this.desc, this.url});

  Feature.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    if (json['prerequisites'] != null) {
      prerequisites = <Prerequisites>[];
      json['prerequisites'].forEach((v) {
        prerequisites!.add(new Prerequisites.fromJson(v));
      });
    }
    desc = json['desc'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['name'] = this.name;
    if (this.prerequisites != null) {
      data['prerequisites'] =
          this.prerequisites!.map((v) => v.toJson()).toList();
    }
    data['desc'] = this.desc;
    data['url'] = this.url;
    return data;
  }
}

class Prerequisites {
  AbilityScore? abilityScore;
  int? minimumScore;

  Prerequisites({this.abilityScore, this.minimumScore});

  Prerequisites.fromJson(Map<String, dynamic> json) {
    abilityScore = json['ability_score'] != null
        ? new AbilityScore.fromJson(json['ability_score'])
        : null;
    minimumScore = json['minimum_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.abilityScore != null) {
      data['ability_score'] = this.abilityScore!.toJson();
    }
    data['minimum_score'] = this.minimumScore;
    return data;
  }
}

class AbilityScore {
  String? index;
  String? name;
  String? url;

  AbilityScore({this.index, this.name, this.url});

  AbilityScore.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}