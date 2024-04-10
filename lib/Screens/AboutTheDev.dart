import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutTheDev extends StatelessWidget {
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
            "عن المطور",
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
      // drawer: const NavigationDrawer(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircleAvatar(
          radius: 112,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 110,
            backgroundImage: AssetImage('assets/images/Developer.jpg'),
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'أ / علي دخيل',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Pacifico',
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'رئيس قسم تكنولوجيا المعلومات والاتصالات بالاسكندرية',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6C8090),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'قطاع عمليات الموارد البشرية',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6C8090),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Color(0xFF6C8090),
          thickness: 1,
          indent: 15,
          endIndent: 15,
          height: 10,
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(
              Icons.phone,
              size: 32,
              color: Color(0xFF2B475E),
            ),
            title: AutoSizeText(
              maxLines: 1,
              '(+20) 1100860890',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(
              Icons.mail,
              size: 32,
              color: Color(0xFF2B475E),
            ),
            title: AutoSizeText(
              maxLines: 1,
              'adekheel@gmail.com',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ]),
    );
  }
}

class AboutTheDes extends StatelessWidget {
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
            "عن المصمم",
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
      // drawer: const NavigationDrawer(),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircleAvatar(
          radius: 112,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 110,
            backgroundColor: Color(0xff253044),
            child: Icon(
              Icons.design_services_outlined,
              size: 200,
            ),
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'م / منى شعبان',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Pacifico',
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'رئيس قسم التحكم بالاسطول غرب الدلتا',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6C8090),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        AutoSizeText(
          maxLines: 1,
          'قطاع المسافات القصيرة',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6C8090),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          color: Color(0xFF6C8090),
          thickness: 1,
          indent: 15,
          endIndent: 15,
          height: 10,
        ),
      ]),
    );
  }
}
