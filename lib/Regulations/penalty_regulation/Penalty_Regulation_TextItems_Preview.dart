import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Penalty_Regulation.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Penalty_Regulation_TextItemsPenalty_Preview.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../animations/FadeAnimation.dart';

class Item_Penalty_regulation_Preview extends StatelessWidget {
  final bookTitle;
  final chapter;
  final section;
  final title;
  final detail;
  final number;
  final searchInput;
  final penalty_group;

  Item_Penalty_regulation_Preview({
    required this.bookTitle,
    required this.chapter,
    required this.section,
    required this.title,
    required this.detail,
    required this.number,
    this.searchInput,
    this.penalty_group,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 200, 206),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            bookTitle,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // centerTitle: true,
        titleSpacing: 5,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        elevation: 20,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(49, 39, 79, 1),
              Color.fromRGBO(196, 135, 198, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                  1,
                  Container(
                    width: width,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                  1.3,
                  Container(
                    width: width,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                  1.6,
                  Container(
                    width: width,
                    height: 400,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: FadeAnimation(
                        1,
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 1, 37),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: FadeAnimation(
                        1,
                        Text(
                          "ماده رقم ${number.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: FadeAnimation(
                        1,
                        Text(
                          chapter,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1,
                      Text(
                        section,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 102, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                    penalty_group != null
                        ? FadeAnimation(
                            1,
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ElevatedButton(
                                    child: Text(
                                      "إضغط هنا لمعرفة العقوبة",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll<Color>(
                                                Color.fromARGB(
                                                    255, 255, 153, 0))),
                                    onPressed: () {
                                      switch (penalty_group) {
                                        case 1 - 1:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .title,
                                                        )));
                                          }
                                          break;

                                        case 1 - 2:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .title,
                                                        )));
                                          }
                                          break;

                                        case 1 - 3:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      27]
                                                                  .title,
                                                        )));
                                          }
                                          break;

                                        case 2:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      28]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      28]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      28]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      28]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      28]
                                                                  .title,
                                                        )));
                                          }
                                          break;
                                        case 3:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      29]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      29]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      29]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      29]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      29]
                                                                  .title,
                                                        )));
                                          }
                                          break;
                                        case 4:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      30]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      30]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      30]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      30]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      30]
                                                                  .title,
                                                        )));
                                          }
                                          break;
                                        case 5:
                                          {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Item_Penalty_group_Preview(
                                                          bookTitle: bookTitle,
                                                          chapter:
                                                              Penalty_Regulation_content[
                                                                      31]
                                                                  .chapter,
                                                          detail:
                                                              Penalty_Regulation_content[
                                                                      31]
                                                                  .detail,
                                                          number:
                                                              Penalty_Regulation_content[
                                                                      31]
                                                                  .number,
                                                          section:
                                                              Penalty_Regulation_content[
                                                                      31]
                                                                  .section,
                                                          title:
                                                              Penalty_Regulation_content[
                                                                      31]
                                                                  .title,
                                                        )));
                                          }
                                          break;
                                      }
                                    }),
                              ),
                            ),
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    Expanded(
                      child:
                          ListView(scrollDirection: Axis.vertical, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 50),
                          child: FadeAnimation(
                            2,
                            searchInput == null
                                ? Text(
                                    detail,
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.justify,
                                    textDirection: TextDirection.rtl,
                                  )
                                : AutoDirection(
                                    text: detail,
                                    child: SubstringHighlight(
                                        text:
                                            detail, // each string needing highlighting
                                        term: searchInput,
                                        textStyle: TextStyle(
                                            color: Colors.blueGrey[900],
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.justify,
                                        textStyleHighlight: TextStyle(
                                          // highlight style
                                          color:
                                              Color.fromARGB(255, 0, 38, 255),
                                          decoration: TextDecoration.underline,
                                        )),
                                  ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
