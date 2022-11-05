class Feature {
  String? index;
  String? name;
  List<String>? desc;
  int? level;
  String? url;

  Feature(this.index, this.name, this.desc, this.level, this.url);


  Feature.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    name = json['name'];
    level = json['level'];
    desc = json['desc'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['index'] = this.index;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['url'] = this.url;
    return data;
  }
}
