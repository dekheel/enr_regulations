import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Regulations/Regulations.dart';
import 'package:enr_regulations/Regulations/Vacance_Regulation/Vacance_Regulations.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Penalty_Regulation.dart';
import 'package:enr_regulations/Laws/laws.dart';
import 'package:flutter/material.dart';
import '../Widgets/PopUp.dart';
import '../Widgets/HomeItemPageBuilder.dart';
import '../Regulations/Hr_Regulation/Hr_Regulations.dart';
import '../Widgets/NavigationDrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: AutoSizeText(
                maxLines: 1,
                "الصفحة الرئيسية",
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
            // backgroundColor: Color.fromRGBO(49, 39, 79, 1).withOpacity(.80),
            // // elevation: 0.0,
            // brightness: Brightness.light,

            bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 5,
                isScrollable: true,
                physics: NeverScrollableScrollPhysics(),
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.menu_book_rounded,
                      size: 25,
                    ),
                    text: "قوانين",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.note_alt_outlined,
                      size: 25,
                    ),
                    text: "لوائح",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.library_books_outlined,
                      size: 25,
                    ),
                    text: "تعليمات وقرارات",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.description,
                      size: 25,
                    ),
                    text: " بطاقة وصف وظيفي",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.video_call,
                      size: 25,
                    ),
                    text: "التدريب",
                  ),
                ]),
          ),
          drawer: const NavigationDrawerMenu(),
          backgroundColor: Color.fromARGB(255, 149, 170, 219),
          body: TabBarView(children: [
            HomeItemPageBuilderLaw(
              civil_service_law_name: civil_service_law[0]["name"],
              civil_service_law_image: civil_service_law[0]["image"],
              civil_worker_law_name: civil_worker_law[0]["name"],
              civil_worker_law_image: civil_worker_law[0]["image"],
              Income_Tax_law_name: Income_Tax_law[0]["name"],
              Income_Tax_law_image: Income_Tax_law[0]["image"],
              Social_Insurance_law_name: Social_Insurance_law[0]["name"],
              Social_Insurance_law_image: Social_Insurance_law[0]["image"],
              Income_Tax_law_progress: Income_Tax_law[0]["progress"],
              Social_Insurance_progress: Social_Insurance_law[0]["progress"],
              civil_service_law_progress: civil_service_law[0]["progress"],
              civil_worker_law_progress: civil_worker_law[0]["progress"],
            ),
            HomeItemPageBuilderRegulation(
              hr_Regulation_name: hr_Regulation_detail[0]["name"],
              hr_Regulation_image: hr_Regulation_detail[0]["image"],
              vacance_Regulation_name: vacance_Regulation_detail[0]["name"],
              vacance_Regulation_image: vacance_Regulation_detail[0]["image"],
              medical_councils_regulation_name:
                  medical_councils_regulation_detail[0]["name"],
              medical_councils_regulation_image:
                  medical_councils_regulation_detail[0]["image"],
              penalty_regulation_name: penalty_regulation_detail[0]["name"],
              penalty_regulation_image: penalty_regulation_detail[0]["image"],
              Company_residence_decision_name:
                  Company_residence_decision_detail[0]["name"],
              Company_residence_decision_image:
                  Company_residence_decision_detail[0]["image"],
              operation_safety_name: operation_safety_detail[0]["name"],
              operation_safety_image: operation_safety_detail[0]["image"],
              Travel_Permit_Regulation_name: Travel_Permit_Regulation[0]
                  ["name"],
              Travel_Permit_Regulation_image: Travel_Permit_Regulation[0]
                  ["image"],
              Finance_Regulation_name: Finance_Regulation[0]["name"],
              Finance_Regulation_image: Finance_Regulation[0]["image"],
              civil_service_Regulation_name: civil_service_Regulation[0]
                  ["name"],
              civil_service_Regulation_image: civil_service_Regulation[0]
                  ["image"],
              Company_residence_decision_progress:
                  Company_residence_decision_detail[0]["progress"],
              Finance_Regulation_progress: Finance_Regulation[0]["progress"],
              civil_service_Regulation_progress: civil_service_Regulation[0]
                  ["progress"],
              Travel_Permit_Regulation_progress: Travel_Permit_Regulation[0]
                  ["progress"],
              hr_Regulation_progress: hr_Regulation_detail[0]["progress"],
              medical_councils_regulation_progress:
                  medical_councils_regulation_detail[0]["progress"],
              operation_safety_progress: operation_safety_detail[0]["progress"],
              penalty_regulation_progress: penalty_regulation_detail[0]
                  ["progress"],
              vacance_Regulation_progress: vacance_Regulation_detail[0]
                  ["progress"],
            ),
            HomeItemPageBuilderDecisions(),
            HomeItemPageBuilderJobDescription(),
            HomeItemPageBuilderTrainings(),
          ]),
        ),
      ),
      onWillPop: () => logoutbutton(context),
    );
  }
}
