import 'dart:convert';

import 'package:dio/dio.dart';

class DndService {
  final Dio dio = Dio();
  final String defaultString = "https://www.dnd5eapi.co/api/";

  getList(String listKey) async {
    try {
      Response response = await dio.get(defaultString + listKey);
      Map<String, dynamic> map = jsonDecode(response.toString());
      print(map["results"][0]["name"]);
      return ;
    } catch (e) {
      print(e);
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
