import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationBox extends StatefulWidget {
  final List<String> infoList;
  final bool isTitle;
  const InformationBox(this.infoList, this.isTitle);

  @override
  State<InformationBox> createState() => _InformationBoxState();
}

Widget getTextWidgets(List<String> strings, bool isTitle) {
  List<Widget> list = <Widget>[];
  if (isTitle) {
    list.add(
      Container(
        alignment: Alignment.center,
        width: 500,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(right: 13.0),
        child: Text(
          textAlign: TextAlign.justify,
          strings[0],
          overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: Color(0xFF212121),
          ),
        ),
      ),
    );
  } else {
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Container(
          alignment: Alignment.center,
          width: 500,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(right: 13.0),
          child: Text(
            textAlign: TextAlign.justify,
            strings[i],
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Roboto',
              color: Color(0xFF212121),
            ),
          ),
        ),
      );
    }
  }
  return new Column(
    children: list,
  );
}

class _InformationBoxState extends State<InformationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              blurRadius: 7,
              spreadRadius: 5,
              offset: Offset(0, 2)),
        ],
      ),
      child: getTextWidgets(widget.infoList, widget.isTitle),
    );
  }
}
