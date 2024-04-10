import 'package:auto_direction/auto_direction.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Administrative_training_video_Preview extends StatefulWidget {
  final bookTitle;
  final title;
  final detail;
  final explanation;
  final ourUrl;
  final searchInput;

  Administrative_training_video_Preview(
      {required this.bookTitle,
      required this.detail,
      required this.title,
      required this.explanation,
      required this.ourUrl,
      this.searchInput});

  @override
  State<Administrative_training_video_Preview> createState() =>
      _Administrative_training_video_PreviewState();
}

class _Administrative_training_video_PreviewState
    extends State<Administrative_training_video_Preview> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget.ourUrl);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 200, 206),
      appBar: MediaQuery.of(context).orientation == Orientation.landscape
          ? null // show nothing in lanscape mode
          : AppBar(
              title: Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  widget.bookTitle.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        border: Border.all(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          width: 7.0,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                        gradient: LinearGradient(
                            colors: [Colors.indigo, Colors.blueAccent]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(2.0, 2.0))
                        ]),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 0, right: 10, left: 10),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 194, 110, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    widget.detail,
                    style: TextStyle(
                        color: Color.fromARGB(255, 102, 0, 0),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Expanded(
                  child: ListView(scrollDirection: Axis.vertical, children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: widget.searchInput == null
                          ? AutoDirection(
                              text: widget.explanation,
                              child: Text(
                                widget.explanation,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 22, 29, 32),
                                    fontSize: 18,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          : AutoDirection(
                              text: widget.explanation,
                              child: SubstringHighlight(
                                  text: widget
                                      .explanation, // each string needing highlighting
                                  term: widget.searchInput,
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 22, 29, 32),
                                      fontSize: 15,
                                      height: 1.5,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                  textStyleHighlight: TextStyle(
                                    // highlight style
                                    color: Color.fromARGB(255, 0, 38, 255),
                                    decoration: TextDecoration.underline,
                                  )),
                            ),
                    ),
                  ]),
                )
              ],
            ),
    );
  }
}
