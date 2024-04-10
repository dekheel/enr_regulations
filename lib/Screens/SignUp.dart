import 'dart:async';
import 'dart:core';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:enr_regulations/Constatnts/Users.dart';
import 'package:enr_regulations/Constatnts/userSheetsApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../animations/FadeAnimation.dart';
import 'Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoaded = false;
  bool _isObscure = true;
  final TextEditingController _sapNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _globalKey = GlobalKey<ScaffoldMessengerState>();
  bool hasInternetConnection = false;
  // ConnectivityResult internetConnectionType = ConnectivityResult.none;
  final TextEditingController passwordController = TextEditingController();
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  var _userSap;
  var _userName = "noData";
  var _usertitle = "noData";
  var _usersection = SectionsList[0];
  var _userwork_zone = WorkZoneList[0];
  var _userphoneNumber = "noData";
  var _userpassword = "noData";
  var _userauthentication = "نوع الحساب: مستخدم عادي";
  var _userActivate = "غير مفعل";
  var _userphoneType = "noData";

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
    _userphoneType = await getPhoneInfo();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      color: Color.fromARGB(0, 0, 237, 245),
      inAsyncCall: isLoaded,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              maxLines: 1,
              "انشاء حساب",
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
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  FadeAnimation(
                    .9,
                    Center(
                      child: AutoSizeText(
                        maxLines: 1,
                        "يرجى التسجيل من الهاتف الشخصي لحضرتك",
                        style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                      1,
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textDirection: TextDirection.rtl,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: TextFormField(
                                      inputFormatters: [
                                        new FilteringTextInputFormatter.allow(
                                            RegExp("[0-9]")),
                                      ],
                                      controller: _sapNumberController,
                                      onChanged: (value) {
                                        _userSap = value;
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: TextFormField(
                                      inputFormatters: [
                                        new FilteringTextInputFormatter.allow(
                                            RegExp("[ أ-ي ]")),
                                      ],
                                      controller: _nameController,
                                      onChanged: (value) {
                                        _userName = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'رجاء ادخال الاسم';
                                        } else if (value.length < 10) {
                                          return 'رجاء ادخال الاسم بالكامل';
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      scrollPadding: EdgeInsets.all(150),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: AutoSizeText(
                                              maxLines: 1, "الاسم بالكامل"),
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: TextFormField(
                                      inputFormatters: [
                                        new FilteringTextInputFormatter.allow(
                                            RegExp("[ أ-ي ]")),
                                      ],
                                      controller: _jobController,
                                      onChanged: (value) {
                                        _usertitle = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'رجاء ادخال الوظيفة';
                                        }
                                      },
                                      keyboardType: TextInputType.text,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      scrollPadding: EdgeInsets.all(150),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: AutoSizeText(
                                              maxLines: 1, "الوظيفة"),
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButtonFormField(
                                    hint: AutoSizeText(
                                        maxLines: 1, "رجاء اختيار القطاع"),
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.centerStart,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                    ),
                                    // dropdownColor: Color.fromRGBO(196, 135, 198, .3),
                                    decoration: InputDecoration(
                                        label: AutoSizeText(
                                          maxLines: 1,
                                          "القطاع",
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffffe599),
                                          ),
                                        )),
                                    value: _usersection,
                                    items: [
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[0],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[0]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[1],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[1]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[2],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[2]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[3],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[3]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[4],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[4]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[5],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[5]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[6],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[6]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[7],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[7]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[8],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[8]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[9],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[9]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[10],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[10]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[11],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[11]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              SectionsList[12],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: SectionsList[12]),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _usersection = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButtonFormField(
                                    hint: AutoSizeText(
                                        maxLines: 1, "رجاء اختيار المنطقة"),
                                    isExpanded: true,
                                    alignment: AlignmentDirectional.centerStart,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle,
                                      color: Color.fromRGBO(49, 39, 79, 1),
                                    ),
                                    // dropdownColor: Color.fromRGBO(196, 135, 198, .3),
                                    decoration: InputDecoration(
                                        label: AutoSizeText(
                                          maxLines: 1,
                                          "المنطقة",
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xffffe599),
                                          ),
                                        )),
                                    value: _userwork_zone,
                                    items: [
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[0],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[0]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[1],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[1]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[2],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[2]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[3],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[3]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[4],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[4]),
                                      DropdownMenuItem(
                                          child: AutoSizeText(
                                              maxLines: 1,
                                              WorkZoneList[5],
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl),
                                          value: WorkZoneList[5]),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _userwork_zone = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: TextFormField(
                                      inputFormatters: [
                                        new FilteringTextInputFormatter.allow(
                                            RegExp("[0-9]")),
                                      ],
                                      controller: _phonenumberController,
                                      onChanged: (value) {
                                        _userphoneNumber = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'رجاء ادخال رقم الهاتف';
                                        } else if (value.length < 11 ||
                                            value.length > 11) {
                                          return 'رجاء ادخال هاتف مكون من 11 رقم';
                                        } else if (_userphoneNumber[0] != "0") {
                                          return 'تاكد من ان اول رقم يكون 0';
                                        } else if (value[1] != "1") {
                                          return 'تاكد من ان ثاني رقم يكون 1';
                                        }
                                      },
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                              decimal: true),
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.right,
                                      scrollPadding: EdgeInsets.all(150),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          label: AutoSizeText(
                                              maxLines: 1, "رقم الهاتف"),
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xffffe599)))),
                                    child: TextFormField(
                                      inputFormatters: [
                                        new FilteringTextInputFormatter.allow(
                                            RegExp("[ a-zA-Z0-9 ]")),
                                      ],
                                      controller: _passwordController,
                                      onChanged: (value) {
                                        _userpassword = value;
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'رجاء ادخال كلمة المرور';
                                        } else if (value.length < 6) {
                                          return 'كلمة المرور يجب الا تقل عن 6 حروف او ارقام';
                                        }
                                      },
                                      keyboardType: TextInputType.text,
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
                      2,
                      GestureDetector(
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromRGBO(49, 39, 79, 1),
                          ),
                          child: const Center(
                            child: AutoSizeText(
                              maxLines: 1,
                              "تسجيل",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            hasInternetConnection =
                                await InternetConnectionChecker().hasConnection;
                            if (hasInternetConnection) {
                              setState(() {
                                isLoaded = true;
                              });
                              await Future.delayed(Duration(seconds: 1),
                                  () async {
                                if (await getUsersData(_userSap) !=
                                    "مسجل من قبل") {
                                  await createUser();
                                  showDialogBoxSignup("تم انشاء الحساب بنجاح");
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "عفواً مُسجًل من قبل!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:
                                        Color.fromARGB(255, 2, 90, 105),
                                    textColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                  );
                                }
                                ;
                              });
                              setState(() {
                                isLoaded = false;
                              });
                            } else {
                              showDialogBox();
                              setState(() => isAlertSet = true);
                            }
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
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

  showDialogBoxSignup(String subject) {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Icon(
          Icons.check_circle_outline,
          size: 25,
          color: Color.fromARGB(255, 19, 104, 1),
        ),
        content: Text(subject),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
            },
            child: const Text('اضغط لتسجيل الدخول'),
          ),
        ],
      ),
    );
  }

  Future createUser() async {
    final user = {
      UserFields.SapNo: _userSap,
      UserFields.Name: _userName,
      UserFields.Title: _usertitle,
      UserFields.Section: _usersection,
      UserFields.Work_Zone: _userwork_zone,
      UserFields.Phone_Number: _userphoneNumber,
      UserFields.Password: _userpassword,
      UserFields.Activation: _userActivate,
      UserFields.Authentication: _userauthentication,
      UserFields.PhoneType: _userphoneType,
      UserFields.Registeration_Date_Time: DateTime.now().toString(),
    };

    await UserSheetsApi.insert([user]);
  }

  Future getUsersData(userSapCheck) async {
    final userdata = await UserSheetsApi.getDataBySap(userSapCheck);
    if (userdata != null) {
      return "مسجل من قبل";
    }
  }
}
