import 'dart:io';
import 'package:enr_regulations/Screens/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:lottie/lottie.dart';

Future<bool> logoutbutton(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          insetAnimationCurve: Curves.decelerate,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "إنتبة",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
              ),
              Lottie.asset("lib/animations/attention.json"),
            ],
          ),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text("هل ترغب في تسجيل الخروج؟"),
                SizedBox(height: 20),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // print('yes selected');
                          // exit(0);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Login()));
                        },
                        child: Text("نعم"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text("لا", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

Future<bool> exitbutton(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                "إنتبة",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
              ),
              Lottie.asset("lib/animations/attention.json"),
            ],
          ),
          insetAnimationCurve: Curves.decelerate,
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text("هل ترغب في الخروج من التطبيق؟"),
                SizedBox(height: 20),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                          FlutterExitApp.exitApp();
                        },
                        child: Text("نعم"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text("لا", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

itemUnavailablePopUp(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          insetAnimationCurve: Curves.decelerate,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Lottie.asset("lib/animations/attention.json"),
            ],
          ),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  "هذا العنصر غير متاح بعد ، شكراً لتفهمكم",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        // print('no selected');
                        Navigator.of(context).pop();
                      },
                      child:
                          Text("فهمت", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    )),
                    Spacer(flex: 1)
                  ],
                )
              ],
            ),
          ),
        );
      });
}
