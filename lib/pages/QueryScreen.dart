import 'package:flutter/material.dart';
import 'dart:async';
import '../models/Generic.dart';
import '../services/DndService.dart';
import '../utils/queryNameEnum.dart';

class QueryScreen extends StatefulWidget {
  final String title;
  const QueryScreen(this.title);


  @override
  _QueryScreenState createState() => new _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  DndService dndService = DndService();
  late Future<List<dynamic>> course;

  void initState()
  {
    super.initState();
    course = _getThingsOnStartup();
  }

  Future<List<dynamic>> _getThingsOnStartup() async {
    var result;
    switch (widget.title) {
      case "Classes":
       result = await dndService.getListOfNames(QueryName.classes.name);
        break;
      case "Raças":
        result = await dndService.getListOfNames(QueryName.races.name);
        break;
      case "Magias":
        result = await dndService.getListOfNames(QueryName.spells.name);
        break;
      case "Talentos":
        result = await dndService.getListOfNames(QueryName.features.name);
        break;
      case "Características":
        result = await dndService.getListOfNames(QueryName.traits.name);
        break;
      case "Equipamentos":
        result = await dndService.getListOfNames(QueryName.equipment.name);
        break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: course,
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].name),
                    onTap: (){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {

  final Generic generic;

  DetailPage(this.generic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(generic.name.toString()),
        )
    );
  }
}
