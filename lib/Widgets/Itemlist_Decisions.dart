import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class makeItem_Decisions extends StatefulWidget {
  final title;
  final number;
  final date;
  final image;

  void Function()? goToDetailPage;

  makeItem_Decisions({
    this.title,
    this.number,
    this.date,
    this.image,
    this.goToDetailPage,
  }) {}

  @override
  State<makeItem_Decisions> createState() => _makeItem_DecisionsState();
}

class _makeItem_DecisionsState extends State<makeItem_Decisions> {
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
                  widget.number + " " + widget.date,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,

                  style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  // textAlign: TextAlign.right
                ),
              ],
            ),
          ),
          onTap: widget.goToDetailPage,
        )),
      ],
    );
  }
}
