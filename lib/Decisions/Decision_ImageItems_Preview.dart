import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DecisionimagePreview extends StatelessWidget {
  final title;
  final image;

  DecisionimagePreview({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 200, 206),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            title,
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
      body: FadeAnimation(
        1,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
                //width: width,
                height: MediaQuery.of(context).size.height - 200,
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Color.fromARGB(255, 205, 200, 206),
                  ),
                  enableRotation: true,
                  imageProvider: CachedNetworkImageProvider(
                    image,
                  ),
                )

                // ),
                ),
          ),
        ),
      ),
    );
  }
}
