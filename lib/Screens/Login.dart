import 'dart:async';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info/device_info.dart';
import 'package:enr_regulations/Constatnts/userSheetsApi.dart';
import 'package:enr_regulations/Screens/Home.dart';
import 'package:enr_regulations/Screens/SignUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Constatnts/Users.dart';
import '../Widgets/PopUp.dart';
import '../animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

var userSap = "1";
var userName = "noData";
var usertitle = "noData";
var usersection = SectionsList[0];
var userwork_zone = WorkZoneList[0];
var userphoneNumber = "noData";
var userpassword = "noData";
var userauthentication = "نوع الحساب: مستخدم عادي";
var userActivate = "غير مفعل";
var userphoneType = "noData";
var userRegistrationTime = "noData";
var userpasswordCheck = "";
var userSapCheck = "";
var userPhoneTypeCheck = "";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

var db = FirebaseFirestore.instance;

class _LoginState extends State<Login> {
  bool isLoaded = false;
  bool _isObscure = true;
  final TextEditingController sapNumberController = TextEditingController();
  final _globalKey = GlobalKey<ScaffoldMessengerState>();
  bool hasInternetConnection = false;
  // ConnectivityResult internetConnectionType = ConnectivityResult.none;
  final TextEditingController passwordController = TextEditingController();
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  final docRef = db.collection("users").doc("85142");

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void initState() {
    getConnectivity();
    super.initState();
    init();
  }

  Future init() async {
    userPhoneTypeCheck = await getPhoneInfo();
    userphoneType = await getPhoneInfo();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // code to launch whatss app

  void getwhatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "+201100860890",
          message: "تفعيل حسابي بتطبيق *لوائح وقوانين س ح م*");
    } else {
      setState(() {
        showDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
            // icon: Icon(Icons.info_outlined),
            content: Column(children: [
              Icon(Icons.info_outlined),
              Text(
                "ليس لديك تطبيق واتس آب مثبتاً!",
                textDirection: TextDirection.rtl,
              ),
            ]),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
      });
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: WillPopScope(
        child: Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -10,
                        height: MediaQuery.of(context).size.height / 2,
                        width: width,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/background.png'),
                                      fit: BoxFit.fill)),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const FadeAnimation(
                          1.5,
                          AutoSizeText(
                            maxLines: 1,
                            "تسجيل الدخول",
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.7,
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(196, 135, 198, .3),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  )
                                ]),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        inputFormatters: [
                                          new FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]")),
                                        ],
                                        controller: sapNumberController,
                                        onChanged: (value) async {
                                          userSapCheck = value;
                                          // await getUsersData(value);
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'رجاء ادخال رقم الساب';
                                          }
                                        },
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: false),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        scrollPadding: EdgeInsets.all(150),
                                        decoration: InputDecoration(
                                            label: AutoSizeText(
                                                maxLines: 1, "رقم الساب"),
                                            border: InputBorder.none,
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        inputFormatters: [
                                          new FilteringTextInputFormatter.allow(
                                              RegExp("[ a-zA-Z0-9 ]")),
                                        ],
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          userpasswordCheck = value;

                                          setState(() {});
                                        },
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'رجاء ادخال كلمة المرور';
                                          }
                                        },
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        autofocus: false,
                                        obscureText: _isObscure,
                                        scrollPadding: EdgeInsets.all(150),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            label: AutoSizeText(
                                                maxLines: 1, "كلمة المرور"),
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              },
                                              icon: Icon(_isObscure
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              color:
                                                  Color.fromRGBO(49, 39, 79, 1),
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.7,
                          Center(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AutoSizeText(
                                  maxLines: 1,
                                  "   ليس لديك حساب؟",
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 135, 198, 1),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                  },
                                  child: const AutoSizeText(
                                    maxLines: 1,
                                    ".اضغط للاشتراك",
                                    style: TextStyle(
                                      color: Color.fromRGBO(196, 135, 198, 1),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.8,
                          Center(
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AutoSizeText(
                                  maxLines: 1,
                                  "   للمساعدة او لتفعيل الحساب؟",
                                  style: TextStyle(
                                    color: Color.fromRGBO(196, 135, 198, 1),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    getwhatsAppOpen();
                                  },
                                  child: const AutoSizeText(
                                    maxLines: 1,
                                    ".اضغط هنا",
                                    style: TextStyle(
                                      color: Color.fromRGBO(196, 135, 198, 1),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.9,
                          GestureDetector(
                              child: Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromRGBO(49, 39, 79, 1),
                                ),
                                child: const Center(
                                  child: AutoSizeText(
                                    maxLines: 1,
                                    "دخول",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  hasInternetConnection =
                                      await InternetConnectionChecker()
                                          .hasConnection;
                                  if (hasInternetConnection) {
                                    setState(() {
                                      isLoaded = true;
                                    });

                                    await Future.delayed(Duration(seconds: 1),
                                        () async {
                                      await getUsersData(userSapCheck);
                                    });

                                    setState(() {
                                      isLoaded = false;
                                    });

                                    if (userSap == userSapCheck) {
                                      if (userpasswordCheck == userpassword) {
                                        if (userPhoneTypeCheck ==
                                            userphoneType) {
                                          if (userActivate == "مفعل") {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Home()));
                                            docRef.get().then(
                                              (DocumentSnapshot doc) async {
                                                final data = await doc.data()
                                                    as Map<String, dynamic>;
                                                print(data);
                                              },
                                              onError: (e) => print(
                                                  "Error getting document: $e"),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "عفواً يرجى تفعيل الحساب!",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Color.fromARGB(
                                                  255, 2, 90, 105),
                                              textColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            );
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                            msg:
                                                "عفواً هذا الهاتف ليس لصاحب الحساب!",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                Color.fromARGB(255, 2, 90, 105),
                                            textColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                          );
                                        }
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: "عفواً كلمة المرور غير صحيحة!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Color.fromARGB(255, 2, 90, 105),
                                          textColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                        );
                                      }
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "عفواً لم يتم التسجيل بعد!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 2, 90, 105),
                                        textColor:
                                            Color.fromARGB(255, 255, 255, 255),
                                      );
                                    }
                                  } else {
                                    showDialogBox();
                                    setState(() => isAlertSet = true);
                                  }
                                }
                              })),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AutoSizeText(
                    maxLines: 1,
                    "version 1.0.0.1",
                    style: TextStyle(
                      color: Color.fromRGBO(196, 135, 198, 1),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () => exitbutton(context),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('الاتصال بالانترنت'),
          content: const Text('رجاء التحقق من اتصالك بالانترنت'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'الغاء');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('موافق'),
            ),
          ],
        ),
      );

  Future getUsersData(userSapCheck) async {
    final userdata = await UserSheetsApi.getDataBySap(userSapCheck);
    if (userdata != null) {
      userSap = userdata.SapNo;
      userName = userdata.Name;
      userpassword = userdata.Password;
      userActivate = userdata.Activation;
      userauthentication = userdata.Authentication;
      userphoneType = userdata.PhoneType;
      userphoneNumber = userdata.Phone_Number;
      userRegistrationTime = userdata.Registeration_Date_Time;
      usersection = userdata.Section;
      usertitle = userdata.Title;
      userwork_zone = userdata.Work_Zone;
    }
  }
}

Future<String> getPhoneInfo() async {
  final _DeviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final info = await _DeviceInfoPlugin.androidInfo;
    return info.model;
  } else if (Platform.isIOS) {
    final info = await _DeviceInfoPlugin.iosInfo;
    return info.model;
  } else {
    throw UnimplementedError();
  }
}
