import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Generic.dart';

class DndService {
  final String defaultString = "https://www.dnd5eapi.co/api/";

  getListOfNames(String queryName) async {
    var data = await http.get(Uri.parse("https://www.dnd5eapi.co/api/" + queryName));
    var jsonData = json.decode(data.body);

    List<Generic> listOfGeneric = [];

    for(var u in jsonData["results"]){
      Generic generic = Generic(u["name"]);
      listOfGeneric.add(generic);
    }

    return listOfGeneric;
  }

  getOne(String listKey, String itemKey) async {
    try {
      var response = await http.get(Uri.parse('$defaultString$listKey/$itemKey'));
      print(response);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
