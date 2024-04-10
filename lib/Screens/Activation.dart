import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Constatnts/userSheetsApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivationPage extends StatefulWidget {
  ActivationPage({super.key});

  @override
  State<ActivationPage> createState() => _ActivationPageState();
}

String _selectedActivation = 'غير مفعل';
String _selectedAuthentication = "نوع الحساب: مستخدم عادي";
String _SapForActivation = "";

class _ActivationPageState extends State<ActivationPage> {
  final TextEditingController sapNumberController = TextEditingController();

  final _globalKey = GlobalKey<ScaffoldMessengerState>();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: AutoSizeText(
            maxLines: 1,
            "إدارة الحسابات",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xffffe599)))),
                child: Form(
                  key: formKey,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextFormField(
                      inputFormatters: [
                        new FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      onChanged: (value) {
                        _SapForActivation = value;
                      },
                      controller: sapNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'رجاء ادخال رقم الساب';
                        }
                      },
                      scrollPadding: EdgeInsets.all(150),
                      decoration: InputDecoration(
                          label: AutoSizeText(maxLines: 1, "رقم الساب"),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xffffe599)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Radio(
                              value: 'غير مفعل',
                              groupValue: _selectedActivation,
                              onChanged: (index) {
                                setState(() {
                                  _selectedActivation = index!;
                                });
                              }),
                          Expanded(
                            child: AutoSizeText(maxLines: 1, 'غير مفعل'),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 'مفعل',
                              groupValue: _selectedActivation,
                              onChanged: (index) {
                                setState(() {
                                  _selectedActivation = index!;
                                });
                              }),
                          Expanded(child: AutoSizeText(maxLines: 1, 'مفعل'))
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xffffe599)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Radio(
                              value: 'نوع الحساب: مدير النظام',
                              groupValue: _selectedAuthentication,
                              onChanged: (index) {
                                setState(() {
                                  _selectedAuthentication = index!;
                                });
                              }),
                          Expanded(
                            child: AutoSizeText(maxLines: 1, 'مدير النظام'),
                          )
                        ],
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                              value: 'نوع الحساب: مستخدم عادي',
                              groupValue: _selectedAuthentication,
                              onChanged: (index) {
                                setState(() {
                                  _selectedAuthentication = index!;
                                });
                              }),
                          Expanded(
                              child: AutoSizeText(maxLines: 1, 'مستخدم عادي'))
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromRGBO(49, 39, 79, 1),
                      ),
                      child: const Center(
                        child: AutoSizeText(
                          maxLines: 1,
                          "تعديل الحساب",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        if (await UserSheetsApi.getDataBySap(
                                _SapForActivation) ==
                            null) {
                          Fluttertoast.showToast(
                            msg: "عفواً لا يوجد حساب لهذا الرقم!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color.fromARGB(255, 2, 90, 105),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                          );
                        } else {
                          UserSheetsApi.updateCell(
                              id: _SapForActivation,
                              key: "Activation",
                              value: _selectedActivation);
                          UserSheetsApi.updateCell(
                              id: _SapForActivation,
                              key: "Authentication",
                              value: _selectedAuthentication);
                        }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
