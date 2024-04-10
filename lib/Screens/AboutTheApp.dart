import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Screens/AboutTheDev.dart';
import 'package:enr_regulations/Widgets/NavigationDrawer.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AboutTheApp extends StatefulWidget {
  @override
  State<AboutTheApp> createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff253044),
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              maxLines: 1,
              "عن التطبيق",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          titleSpacing: 1,
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
        drawer: const NavigationDrawerMenu(),
        body: ListView(
          children: [
            FadeAnimation(
              1,
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: AutoSizeText(
                  maxLines: 1,
                  "تحت رعاية",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 243, 185, 185),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FadeAnimation(
                2,
                Container(
                  child: AutoSizeText(
                    maxLines: 2,
                    "معالي الفريق/كامل الوزير\nوزير النقل والمواصلات",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 143, 140, 140),
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        height: 1.2),
                  ),
                )),
            FadeAnimation(
                3,
                Container(
                  child: AutoSizeText(
                    maxLines: 2,
                    "السيد المهندس/محمد عامر\nرئيس مجلس إدارة الهيئة القومية لسكك حديد مصر",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        height: 1.2),
                  ),
                )),
            FadeAnimation(
                4,
                Container(
                  child: AutoSizeText(
                    maxLines: 2,
                    "السيد الاستاذ الدكتور/محمد حسين عبدالعزيز\nنائب رئيس مجلس الادارة لقطاع الموارد البشرية",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        height: 1.2),
                  ),
                )),
            FadeAnimation(
              5,
              AutoSizeText(
                maxLines: 1,
                "تطبيق لوائح وقوانين سكك حديد مصر",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color.fromARGB(255, 243, 185, 185),
                  fontSize: 35,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            FadeAnimation(
              6,
              AutoSizeText(
                maxLines: 3,
                "لمساعدة جميع العاملين في الارتقاء بمستواهم الوظيفي من ناحية المامهم بكافة القوانين واللوائح والقرارات الخاصه بالهيئة وكذا استمرارهم في الاطلاع على كل ما هو جديد من الناحية التدريبية.",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            FadeAnimation(
              7,
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage(
                      "assets/images/ic_launcher_foreground_ios.png"),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FadeAnimation(1, _buttonsForDevolopers()
            // GestureDetector(
            //   child: CircleAvatar(
            //     radius: 29,
            //     backgroundColor: Color.fromARGB(255, 204, 204, 204),
            //     child: CircleAvatar(
            //       radius: 25,
            //       backgroundImage: AssetImage('assets/images/Developer.png'),
            //     ),
            //   ),
            //   onTap: () {
            //     AboutTheDeveloper(context);
            //   },
            // ),
            ));
  }

  Widget _buttonsForDevolopers() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      renderOverlay: false,
      backgroundColor: Color(0xFF801E48),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.developer_mode),
            backgroundColor: Color(0xFF801E48),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutTheDev()));
            },
            label: 'عن المطور',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48)),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.design_services_outlined),
            backgroundColor: Color(0xFF801E48),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutTheDes()));
            },
            label: 'عن المصمم',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48))
      ],
    );
  }
}
