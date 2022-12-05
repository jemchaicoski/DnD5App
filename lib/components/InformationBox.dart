import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationBox extends StatefulWidget {
  final List<String> infoList;
  const InformationBox(this.infoList);

  @override
  State<InformationBox> createState() => _InformationBoxState();
}

Widget getTextWidgets(List<String> strings)
{
  List<Widget> list = <Widget>[];
  for(var i = 0; i < strings.length; i++){
    list.add(
      new Container(
        margin: EdgeInsets.all(5),
        padding: new EdgeInsets.only(right: 13.0),
        child: new Text(
          textAlign: TextAlign.justify,
          strings[i],
          overflow: TextOverflow.visible,
          style: new TextStyle(
            fontSize: 15.0,
            fontFamily: 'Roboto',
            color: new Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  return new Column(children: list,);
}

class _InformationBoxState extends State<InformationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 7,
            spreadRadius: 5,
            offset: Offset(0, 2)
          ),
        ],
      ),
      child: getTextWidgets(widget.infoList),
    );
  }
}
