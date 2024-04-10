import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../animations/FadeAnimation.dart';

class vacanceItemPreview extends StatelessWidget {
  final bookTitle;
  final section;
  final title;
  final detail;
  final number;
  final searchInput;

  vacanceItemPreview(
      {required this.bookTitle,
      required this.section,
      required this.title,
      required this.detail,
      required this.number,
      this.searchInput});

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
              padding: const EdgeInsets.all(20.0),
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
                              fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 5),
                      child: FadeAnimation(
                        1,
                        Text(
                          "صفحة رقم ${number.toString()}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 120),
                      child: FadeAnimation(
                        1,
                        Text(
                          section,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 102, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          ListView(scrollDirection: Axis.vertical, children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50),
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
