import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QueryScreen extends StatefulWidget {
  final String title;
  const QueryScreen(this.title);


  @override
  _QueryScreenState createState() => new _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  late Future<List<dynamic>> course;

  void initState()
  {
    super.initState();
    course = _getFeatures();
  }

  Future<List<Generic>> _getFeatures() async {
    print("entrou");
    var data = await http.get(Uri.parse("https://www.dnd5eapi.co/api/features"));
    var jsonData = json.decode(data.body);

    List<Generic> users = [];

    for(var u in jsonData){
      Generic generic = Generic(u["index"]);

      users.add(generic);

    }

    print(users.length);

    return users;

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
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data[index].picture
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
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
          title: Text(generic.index.toString()),
        )
    );
  }
}


class Generic {
  final int index;

  Generic(this.index);

}
