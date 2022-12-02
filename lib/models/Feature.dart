class Feature {
  String? name;
  String? desc;
  int? level;
  String? url;

  Feature(this.name, this.desc, this.level, this.url);


  Feature.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    level = json['level'];
    desc = json['desc'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['url'] = this.url;
    return data;
  }

  @override
  String toString() {
    return 'Feature{name: $name, desc: $desc, level: $level, url: $url}';
  }
}
