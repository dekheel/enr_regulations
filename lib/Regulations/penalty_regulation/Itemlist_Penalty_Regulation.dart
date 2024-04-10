import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class makeItem_Penalty_Regulation extends StatefulWidget {
  final title;
  final numberItem;
  final chapter;
  final section;

  void Function()? goToDetailPage;

  makeItem_Penalty_Regulation({
    this.title,
    this.numberItem,
    this.chapter,
    this.section,
    this.goToDetailPage,
  }) {}

  @override
  State<makeItem_Penalty_Regulation> createState() =>
      _makeItem_Penalty_RegulationState();
}

class _makeItem_Penalty_RegulationState
    extends State<makeItem_Penalty_Regulation> {
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
                  widget.chapter,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.section,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,

                  style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 10,
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
              AutoSizeText(
                maxLines: 1,
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
