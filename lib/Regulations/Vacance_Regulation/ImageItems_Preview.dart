import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:substring_highlight/substring_highlight.dart';

class vacanceimagePreview extends StatelessWidget {
  final subjectTitle;
  final section;
  final title;
  final image;
  final number;
  final detail;
  final searchInput;

  vacanceimagePreview(
      {required this.subjectTitle,
      required this.section,
      required this.title,
      required this.image,
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
          child: AutoSizeText(
            maxLines: 1,
            subjectTitle,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              child: FadeAnimation(
            1,
            AutoSizeText(
              maxLines: 1,
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 1, 37),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )),
          FadeAnimation(
            1,
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                child: AutoSizeText(
                  maxLines: 1,
                  section,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
            ),
          ),
          FadeAnimation(
            1,
            searchInput == null
                ? Container(
                    child: AutoSizeText(
                      maxLines: 1,
                      detail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                : Container(
                    child: AutoDirection(
                      text: detail,
                      child: SubstringHighlight(
                          text: detail,
                          term: searchInput,
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textStyleHighlight: TextStyle(
                            // highlight style
                            color: Color.fromARGB(255, 0, 38, 255),
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ),
          ),
          FadeAnimation(
            1,
            Expanded(
              child: Container(
                //width: width,
                height: height - 200,
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 200, 206),
                  ),
                  enableRotation: true,
                  imageProvider: AssetImage(image),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
