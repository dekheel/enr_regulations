import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Screens/AboutTheApp.dart';
import 'package:enr_regulations/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import '../Screens/Activation.dart';
import '../Screens/Home.dart';
import 'PopUp.dart';

class NavigationDrawerMenu extends StatefulWidget {
  const NavigationDrawerMenu({super.key});

  @override
  State<NavigationDrawerMenu> createState() => _NavigationDrawerMenuState();
}

class _NavigationDrawerMenuState extends State<NavigationDrawerMenu> {
// code to launch whatss app

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BuildHeader(context),
            BuildMenuItems(context),
          ],
        )),
      );

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
  }
}

Widget BuildMenuItems(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          // height: MediaQuery.of(context).size.height,

          child: Wrap(runSpacing: .5, children: [
            ListTile(
              leading: const Icon(Icons.home_outlined,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text(
                "الصفحه الرئيسية",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Home()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text(
                "عن التطبيق",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AboutTheApp()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.report_problem,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text(
                "الابلاغ عن مشكلة",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () async {
                bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

                if (whatsapp) {
                  await FlutterLaunch.launchWhatsapp(
                      phone: "+201100860890", message: "");
                } else {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      icon: Icon(Icons.info_outlined),
                      content: const Text(
                        "ليس لديك تطبيق واتس آب مثبتاً!",
                        textDirection: TextDirection.rtl,
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromRGBO(49, 39, 79, 1),
                              ),
                              child: const Center(
                                child: Text(
                                  "فهمت",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  );
                }
                ;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.login_outlined,
                  color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text(
                "تسجيل خروج",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () {
                logoutbutton(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
              ),
            ),
            ListTile(
              leading:
                  const Icon(Icons.logout, color: Color.fromARGB(255, 0, 0, 0)),
              title: const Text(
                "خروج من التطبيق",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              onTap: () {
                exitbutton(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
              ),
            ),
            userauthentication == "نوع الحساب: مدير النظام"
                ? Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.settings,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        title: const Text(
                          "إدارة الحسابات",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActivationPage()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Divider(
                          color: Colors.black54,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  )
                : Text(""),
          ]),
        ),
      ],
    );

Widget BuildHeader(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.blue.shade600,
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: Column(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                // color: Colors.yellow[900],
                image: AssetImage("assets/images/ENRLOGO.png"),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
              ),
            ),
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      "مرحباً بك,",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 0, 0)),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      // user[userSap.toString()]!["name"].toString(),
                      userName,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      // user[userSap.toString()]!["name"].toString(),
                      usertitle,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      // user[userSap.toString()]!["name"].toString(),
                      usersection,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      // user[userSap.toString()]!["name"].toString(),
                      userwork_zone,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      // user[userSap.toString()]!["name"].toString(),
                      userauthentication,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
