import 'dart:convert';

import 'package:dio/dio.dart';

class DndService {
  final Dio dio = Dio();
  final String defaultString = "https://www.dnd5eapi.co/api/";

  Future<List<dynamic>> getList(String listKey) async {
    try {
      Response response = await dio.get(defaultString + listKey);
      Map<String, dynamic> map = jsonDecode(response.toString());
      //print(map["results"][0]["name"]);
      print(map["results"][0]);
      return map["results"];
    } catch (e) {
      print(e);
      throw Error();
    }
  }

  getOne(String listKey, String itemKey) async {
    try {
      Response response = await dio.get('$defaultString$listKey/$itemKey');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
