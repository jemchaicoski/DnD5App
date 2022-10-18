import 'package:dio/dio.dart';

class DndService {
  final Dio dio = Dio();
  final String defaultString = "https://www.dnd5eapi.co/api/";

  getAllSpells() async {
    try{
      Response response = await dio.get(defaultString + '/spells/');
      print(response.data);
      return response.data;
    } catch (e){
      print(e);
    }
  }
}

