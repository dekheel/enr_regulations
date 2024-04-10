import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class makeItem_Laws_Regulations extends StatefulWidget {
  final title;
  final numberItem;
  final section;

  void Function()? goToDetailPage;

  makeItem_Laws_Regulations({
    this.title,
    this.numberItem,
    this.section,
    this.goToDetailPage,
  }) {}

  @override
  State<makeItem_Laws_Regulations> createState() =>
      _makeItem_Laws_RegulationsState();
}

class _makeItem_Laws_RegulationsState extends State<makeItem_Laws_Regulations> {
  @override
  Widget build(BuildContext context) {
    Color colorisSelected = Colors.green;

    var color1 = Color.fromARGB(255, 47, 37, 78).withOpacity(.70);
    var color2 = Color.fromARGB(255, 47, 37, 78).withOpacity(.90);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  color1,
                  color2,
                  // WE NEED ON CLICK
                  // Color.fromARGB(255, 9, 112, 0).withOpacity(.70),
                  // Color.from ARGB(255, 5, 63, 0).withOpacity(.70),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.section,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,

                  style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.right
                )
              ],
            ),
          ),
          onTap: widget.goToDetailPage,
        )),
        Container(
          // width: ,
          height: 110,
          margin: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.numberItem.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(49, 39, 79, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
