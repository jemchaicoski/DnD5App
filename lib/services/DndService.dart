import 'dart:convert';

import 'package:dio/dio.dart';

class DndService {
  final Dio dio = Dio();
  final String defaultString = "https://www.dnd5eapi.co/api/";

  getList(String listKey) async {
    try {
      Response response = await dio.get(defaultString + listKey);
      //print(response.data);
      return jsonDecode(response.data);
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
