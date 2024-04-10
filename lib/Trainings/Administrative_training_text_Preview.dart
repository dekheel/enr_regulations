import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

class Administrative_training_text_Preview extends StatelessWidget {
  final bookTitle;
  final title;
  final detail;
  final explanation;
  final searchInput;

  Administrative_training_text_Preview(
      {required this.bookTitle,
      required this.detail,
      required this.title,
      required this.explanation,
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
          child: AutoSizeText(
            maxLines: 1,
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
                            image: AssetImage('assets/images/one.svg'),
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
                            image: AssetImage('assets/images/one.svg'),
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
                            image: AssetImage('assets/images/one.svg'),
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
                        AutoSizeText(
                          maxLines: 1,
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 1, 37),
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
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
                                ? AutoDirection(
                                    text: explanation,
                                    child: AutoSizeText(
                                      maxLines: 1,
                                      explanation,
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 22, 29, 32),
                                          fontSize: 18,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                : AutoDirection(
                                    text: explanation,
                                    child: SubstringHighlight(
                                        text:
                                            explanation, // each string needing highlighting
                                        term: searchInput,
                                        textStyle: TextStyle(
                                            color:
                                                Color.fromARGB(255, 22, 29, 32),
                                            fontSize: 15,
                                            height: 1.5,
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
