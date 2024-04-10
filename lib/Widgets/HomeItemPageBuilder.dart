import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:enr_regulations/Decisions/GlobalDecisionIndex.dart';
import 'package:enr_regulations/Decisions/HrDecisionIndex.dart';
import 'package:enr_regulations/Laws/laws.dart';
import 'package:enr_regulations/Regulations/Hr_Regulation/Hr_RegulationIndex.dart';
import 'package:enr_regulations/Regulations/Vacance_Regulation/Vacance_RegulationIndex.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/PenaltyRegulationIndex.dart';
import 'package:enr_regulations/Screens/Login.dart';
import 'package:enr_regulations/Trainings/Administrative/AdministrativeTrainingIndex.dart';
import 'package:enr_regulations/Trainings/BlueCaller/BlueCallerTrainingIndex.dart';
import 'package:enr_regulations/Trainings/Skills/SkillTrainingIndex.dart';
import 'package:enr_regulations/Widgets/Popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';

import '../Laws/civil_service_law/CivilServiceLawIndex.dart';

//for laws

class HomeItemPageBuilderLaw extends StatefulWidget {
  final String? civil_service_law_image;
  final String? civil_service_law_name;
  final double? civil_service_law_progress;

  final String? civil_worker_law_image;
  final String? civil_worker_law_name;
  final double? civil_worker_law_progress;

  final String? Social_Insurance_law_name;
  final String? Social_Insurance_law_image;
  final double? Social_Insurance_progress;

  final String? Income_Tax_law_name;
  final String? Income_Tax_law_image;
  final double? Income_Tax_law_progress;

  HomeItemPageBuilderLaw(
      {required this.civil_service_law_image,
      required this.civil_service_law_name,
      required this.civil_worker_law_image,
      required this.civil_worker_law_name,
      required this.Social_Insurance_law_name,
      required this.Social_Insurance_law_image,
      required this.Income_Tax_law_name,
      required this.Income_Tax_law_image,
      required this.Income_Tax_law_progress,
      required this.Social_Insurance_progress,
      required this.civil_service_law_progress,
      required this.civil_worker_law_progress});

  @override
  State<HomeItemPageBuilderLaw> createState() => _HomeItemPageBuilderLawState();
}

class _HomeItemPageBuilderLawState extends State<HomeItemPageBuilderLaw> {
  final borderColor = Color.fromRGBO(49, 39, 79, 1);

  final colorText = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        child: GestureDetector(
                            child: Stack(children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 75, top: 115),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 2 -
                                    16,
                                height:
                                    (MediaQuery.of(context).size.height) / 3 -
                                        16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 5,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.civil_worker_law_image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: (MediaQuery.of(context).size.width) /
                                            2 -
                                        16,
                                    height:
                                        (MediaQuery.of(context).size.height) /
                                                3 -
                                            16,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: borderColor,
                                        width: 5,
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(20),
                                //   border: Border.all(
                                //     color: borderColor,
                                //     width: 5,
                                //   ),
                                //   image: DecorationImage(
                                //     fit: BoxFit.fill,
                                //     image: CachedNetworkImageProvider(
                                //          widget.civil_service_law_image!),
                                //   ),
                                // ),
                              ),
                            ]),
                            onTap: () {
                              setState(() {
                                itemUnavailablePopUp(context);
                              });
                            }),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: AutoSizeText(
                              maxLines: 1,
                              widget.civil_worker_law_name!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arslan",
                                color: colorText,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: borderColor,
                              width: 5,
                            ),
                            color: borderColor,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 8,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GFProgressBar(
                              percentage: widget.civil_worker_law_progress!,
                              lineHeight: 10,
                              backgroundColor: Colors.black12,
                              progressBarColor: Color.fromARGB(255, 0, 255, 85),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.civil_service_law_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    CivilServiceLawIndex()));
                          },
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: AutoSizeText(
                              maxLines: 1,
                              widget.civil_service_law_name!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arslan",
                                color: colorText,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: borderColor,
                              width: 5,
                            ),
                            color: borderColor,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 8,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GFProgressBar(
                              percentage: 1.00,
                              lineHeight: 10,
                              backgroundColor: Colors.black12,
                              progressBarColor: Color.fromARGB(255, 0, 255, 85),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        child: GestureDetector(
                            child: Stack(children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 75, top: 115),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 2 -
                                    16,
                                height:
                                    (MediaQuery.of(context).size.height) / 3 -
                                        16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 5,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.Social_Insurance_law_image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: (MediaQuery.of(context).size.width) /
                                            2 -
                                        16,
                                    height:
                                        (MediaQuery.of(context).size.height) /
                                                3 -
                                            16,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: borderColor,
                                        width: 5,
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(20),
                                //   border: Border.all(
                                //     color: borderColor,
                                //     width: 5,
                                //   ),
                                //   image: DecorationImage(
                                //     fit: BoxFit.fill,
                                //     image: CachedNetworkImageProvider(
                                //          widget.civil_service_law_image!),
                                //   ),
                                // ),
                              ),
                            ]),
                            onTap: () {
                              setState(() {
                                itemUnavailablePopUp(context);
                              });
                            }),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: AutoSizeText(
                              maxLines: 1,
                              widget.Social_Insurance_law_name!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arslan",
                                color: colorText,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: borderColor,
                              width: 5,
                            ),
                            color: borderColor,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 8,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GFProgressBar(
                              percentage: widget.Social_Insurance_progress!,
                              lineHeight: 10,
                              backgroundColor: Colors.black12,
                              progressBarColor: Color.fromARGB(255, 0, 255, 85),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 8,
                          right: 8,
                          bottom: 8,
                        ),
                        child: GestureDetector(
                            child: Stack(children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 75, top: 115),
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width) / 2 -
                                    16,
                                height:
                                    (MediaQuery.of(context).size.height) / 3 -
                                        16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 5,
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.Income_Tax_law_image!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: (MediaQuery.of(context).size.width) /
                                            2 -
                                        16,
                                    height:
                                        (MediaQuery.of(context).size.height) /
                                                3 -
                                            16,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: borderColor,
                                        width: 5,
                                      ),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),

                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(20),
                                //   border: Border.all(
                                //     color: borderColor,
                                //     width: 5,
                                //   ),
                                //   image: DecorationImage(
                                //     fit: BoxFit.fill,
                                //     image: CachedNetworkImageProvider(
                                //          widget.civil_service_law_image!),
                                //   ),
                                // ),
                              ),
                            ]),
                            onTap: () {
                              setState(() {
                                itemUnavailablePopUp(context);
                              });
                            }),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: AutoSizeText(
                              maxLines: 1,
                              widget.Income_Tax_law_name!,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arslan",
                                color: colorText,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: borderColor,
                              width: 5,
                            ),
                            color: borderColor,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 8,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width) / 2 - 16,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: GFProgressBar(
                              percentage: widget.Income_Tax_law_progress!,
                              lineHeight: 10,
                              backgroundColor: Colors.black12,
                              progressBarColor: Color.fromARGB(255, 0, 255, 85),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
        scrollDirection: Axis.vertical,
      ),
    );
  }
}

// for regulations

class HomeItemPageBuilderRegulation extends StatefulWidget {
  final String? medical_councils_regulation_image;
  final String? medical_councils_regulation_name;
  final double? medical_councils_regulation_progress;

  final String? penalty_regulation_image;
  final String? penalty_regulation_name;
  final double? penalty_regulation_progress;

  final String? vacance_Regulation_image;
  final String? vacance_Regulation_name;
  final double? vacance_Regulation_progress;

  final String? hr_Regulation_image;
  final String? hr_Regulation_name;
  final double? hr_Regulation_progress;

  final String? Company_residence_decision_image;
  final String? Company_residence_decision_name;
  final double? Company_residence_decision_progress;

  final String? operation_safety_image;
  final String? operation_safety_name;
  final double? operation_safety_progress;

  final String? Travel_Permit_Regulation_image;
  final String? Travel_Permit_Regulation_name;
  final double? Travel_Permit_Regulation_progress;

  final String? Finance_Regulation_image;
  final String? Finance_Regulation_name;
  final double? Finance_Regulation_progress;

  final String? civil_service_Regulation_image;
  final String? civil_service_Regulation_name;
  final double? civil_service_Regulation_progress;

  HomeItemPageBuilderRegulation({
    required this.medical_councils_regulation_image,
    required this.medical_councils_regulation_name,
    required this.penalty_regulation_image,
    required this.penalty_regulation_name,
    required this.vacance_Regulation_image,
    required this.vacance_Regulation_name,
    required this.hr_Regulation_image,
    required this.hr_Regulation_name,
    required this.Company_residence_decision_image,
    required this.Company_residence_decision_name,
    required this.operation_safety_image,
    required this.operation_safety_name,
    required this.Travel_Permit_Regulation_image,
    required this.Travel_Permit_Regulation_name,
    required this.Finance_Regulation_image,
    required this.Finance_Regulation_name,
    required this.civil_service_Regulation_image,
    required this.civil_service_Regulation_name,
    required this.Company_residence_decision_progress,
    required this.Finance_Regulation_progress,
    required this.Travel_Permit_Regulation_progress,
    required this.civil_service_Regulation_progress,
    required this.hr_Regulation_progress,
    required this.medical_councils_regulation_progress,
    required this.operation_safety_progress,
    required this.penalty_regulation_progress,
    required this.vacance_Regulation_progress,
  });

  @override
  State<HomeItemPageBuilderRegulation> createState() =>
      _HomeItemPageBuilderRegulationState();
}

class _HomeItemPageBuilderRegulationState
    extends State<HomeItemPageBuilderRegulation> {
  final borderColor = Color.fromARGB(255, 136, 62, 1);

  final colorText = Color.fromARGB(255, 255, 255, 255);

  //controller to navigate page view
  final controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView(children: [
        //First page 1
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                        child: Stack(children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 75, top: 115),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width) / 2 - 16,
                            height:
                                (MediaQuery.of(context).size.height) / 3 - 16,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: borderColor,
                                width: 5,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: widget.hr_Regulation_image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: (MediaQuery.of(context).size.width) / 2 -
                                    16,
                                height:
                                    (MediaQuery.of(context).size.height) / 3 -
                                        16,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: borderColor,
                                    width: 5,
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),

                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(20),
                            //   border: Border.all(
                            //     color: borderColor,
                            //     width: 5,
                            //   ),
                            //   image: DecorationImage(
                            //     fit: BoxFit.fill,
                            //     image: CachedNetworkImageProvider(
                            //          widget.civil_service_law_image!),
                            //   ),
                            // ),
                          ),
                        ]),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  hrRegulationIndex()));
                        },
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.hr_Regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage: 1.00,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.penalty_regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PenaltyRegulationIndex()));
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.penalty_regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage: 1.00,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.vacance_Regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              setState(() {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        vacanceRegulationIndex()));
                              });
                            });
                          }),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.vacance_Regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage: .10,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.medical_councils_regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.medical_councils_regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage:
                                widget.medical_councils_regulation_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.Company_residence_decision_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.Company_residence_decision_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage:
                                widget.Company_residence_decision_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.operation_safety_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.operation_safety_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage: widget.operation_safety_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.Travel_Permit_Regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.Travel_Permit_Regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage:
                                widget.Travel_Permit_Regulation_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.Finance_Regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.Finance_Regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage: widget.Finance_Regulation_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 8,
                        right: 8,
                        bottom: 8,
                      ),
                      child: GestureDetector(
                          child: Stack(children: [
                            Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 75, top: 115),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            Container(
                              width:
                                  (MediaQuery.of(context).size.width) / 2 - 16,
                              height:
                                  (MediaQuery.of(context).size.height) / 3 - 16,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: borderColor,
                                  width: 5,
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    widget.civil_service_Regulation_image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width:
                                      (MediaQuery.of(context).size.width) / 2 -
                                          16,
                                  height:
                                      (MediaQuery.of(context).size.height) / 3 -
                                          16,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 5,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),

                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(20),
                              //   border: Border.all(
                              //     color: borderColor,
                              //     width: 5,
                              //   ),
                              //   image: DecorationImage(
                              //     fit: BoxFit.fill,
                              //     image: CachedNetworkImageProvider(
                              //          widget.civil_service_law_image!),
                              //   ),
                              // ),
                            ),
                          ]),
                          onTap: () {
                            setState(() {
                              itemUnavailablePopUp(context);
                            });
                          }),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            maxLines: 1,
                            widget.civil_service_Regulation_name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arslan",
                              color: colorText,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: borderColor,
                            width: 5,
                          ),
                          color: borderColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: (MediaQuery.of(context).size.width) / 2 - 16,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GFProgressBar(
                            percentage:
                                widget.civil_service_Regulation_progress!,
                            lineHeight: 10,
                            backgroundColor: Colors.black12,
                            progressBarColor: Color.fromARGB(255, 0, 255, 85),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

// for decisions

class HomeItemPageBuilderDecisions extends StatefulWidget {
  @override
  State<HomeItemPageBuilderDecisions> createState() =>
      _HomeItemPageBuilderDecisionsState();
}

class _HomeItemPageBuilderDecisionsState
    extends State<HomeItemPageBuilderDecisions> {
  final borderColor = Color.fromRGBO(49, 39, 79, 1);

  final colorText = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  child: AutoSizeText(
                maxLines: 2,
                "لم يتم اضافتها بعد\nانتظرونا قريباً",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ));
  }
  //   userauthentication != "نوع الحساب: مستخدم عادي"
  //       ? Padding(
  //           padding: const EdgeInsets.only(bottom: 8.0),
  //           child: SingleChildScrollView(
  //             child: Expanded(
  //               child: Column(
  //                 children: [
  //                   Container(
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(2.0),
  //                       child: GestureDetector(
  //                         child: Container(
  //                           height: MediaQuery.of(context).size.height / 7,
  //                           width: MediaQuery.of(context).size.width / 2,
  //                           padding: EdgeInsets.all(5),
  //                           alignment: Alignment.center,
  //                           decoration: BoxDecoration(
  //                               color: Colors.blueAccent,
  //                               border: Border.all(
  //                                 color: borderColor,
  //                                 width: 3.0,
  //                               ),
  //                               borderRadius: BorderRadius.circular(20.0),
  //                               gradient: LinearGradient(colors: [
  //                                 Colors.blueAccent,
  //                                 Colors.indigo,
  //                               ]),
  //                               boxShadow: [
  //                                 BoxShadow(
  //                                     color: Colors.grey,
  //                                     blurRadius: 2.0,
  //                                     offset: Offset(2.0, 2.0))
  //                               ]),
  //                           margin: EdgeInsets.all(2),
  //                           child: AutoSizeText(
  //                               maxLines: 1,
  //                               "قرارات وتعليمات عامة",
  //                               textDirection: TextDirection.rtl,
  //                               textAlign: TextAlign.center,
  //                               style: TextStyle(
  //                                 fontSize: 40,
  //                                 fontWeight: FontWeight.bold,
  //                                 color: colorText,
  //                               )),
  //                         ),
  //                         onTap: () {
  //                           Navigator.of(context).push(MaterialPageRoute(
  //                               builder: (BuildContext context) =>
  //                                   GlobalDecisionIndex()));
  //                           setState(() {});
  //                         },
  //                       ),
  //                     ),
  //                   ),
  //                   GridView.count(
  //                       physics: ScrollPhysics(),
  //                       crossAxisCount: 2,
  //                       crossAxisSpacing: 8.0,
  //                       mainAxisSpacing: .6,
  //                       childAspectRatio: (2 / 1),
  //                       shrinkWrap: true,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               padding: EdgeInsets.all(5),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n الموارد البشرية",
  //                                   textDirection: TextDirection.rtl,
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               Navigator.of(context).push(MaterialPageRoute(
  //                                   builder: (BuildContext context) =>
  //                                       HrDecisionIndex()));
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n الصيانة والدعم الفني",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               padding: EdgeInsets.all(5),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n نقل البضائع",
  //                                   textDirection: TextDirection.rtl,
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n الخدمات المشتركة",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               padding: EdgeInsets.all(5),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n المسافات القصيرة",
  //                                   textDirection: TextDirection.rtl,
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n المسافات الطويلة",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               padding: EdgeInsets.all(5),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n البنية الأساسية",
  //                                   textDirection: TextDirection.rtl,
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n السلامة والجودة",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n الشئون المالية",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات قطاع\n المشروعات الهندسية",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               padding: EdgeInsets.all(5),
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات إدارة\n الاحتياجات",
  //                                   textDirection: TextDirection.rtl,
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات إدارة\n المراجعة الداخلية والفحص",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(2.0),
  //                           child: GestureDetector(
  //                             child: Container(
  //                               height: MediaQuery.of(context).size.height / 10,
  //                               width: MediaQuery.of(context).size.width / 3,
  //                               alignment: Alignment.center,
  //                               decoration: BoxDecoration(
  //                                   color: Colors.blueAccent,
  //                                   border: Border.all(
  //                                     color: borderColor,
  //                                     width: 3.0,
  //                                   ),
  //                                   borderRadius: BorderRadius.circular(20.0),
  //                                   gradient: LinearGradient(colors: [
  //                                     Color(0xFFd4ab99),
  //                                     Color(0xFF755e5e),
  //                                   ]),
  //                                   boxShadow: [
  //                                     BoxShadow(
  //                                         color: Colors.grey,
  //                                         blurRadius: 2.0,
  //                                         offset: Offset(2.0, 2.0))
  //                                   ]),
  //                               margin: EdgeInsets.all(2),
  //                               child: AutoSizeText(
  //                                   maxLines: 2,
  //                                   "تعليمات\nالإدارة العامة للأمن",
  //                                   textAlign: TextAlign.center,
  //                                   textDirection: TextDirection.rtl,
  //                                   style: TextStyle(
  //                                     fontSize: 40,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: colorText,
  //                                   )),
  //                             ),
  //                             onTap: () {
  //                               itemUnavailablePopUp(context);

  //                               setState(() {});
  //                             },
  //                           ),
  //                         ),
  //                       ]),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         )
  //       : Normal_User();
  // }

// popup permission
//   PermissionPopUp(context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return CupertinoAlertDialog(
//             insetAnimationCurve: Curves.decelerate,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               textDirection: TextDirection.rtl,
//               children: [
//                 Lottie.asset("lib/animations/attention.json"),
//               ],
//             ),
//             content: Container(
//               height: 90,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 textDirection: TextDirection.rtl,
//                 children: [
//                   AutoSizeText(
//                     maxLines: 1,
//                     "عفواً ليس لديك صلاحية الدخول ، شكراً لتفهمكم",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     textDirection: TextDirection.rtl,
//                     children: [
//                       Spacer(flex: 1),
//                       Expanded(
//                           child: ElevatedButton(
//                         onPressed: () {
//                           // print('no selected');
//                           Navigator.of(context).pop();
//                         },
//                         child: AutoSizeText(
//                             maxLines: 1,
//                             "فهمت",
//                             style: TextStyle(color: Colors.black)),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                         ),
//                       )),
//                       Spacer(flex: 1)
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   Normal_User() {
//     if (usersection == "المسافات القصيرة") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n المسافات القصيرة",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "عمليات الموارد البشرية") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n الموارد البشرية",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (BuildContext context) => HrDecisionIndex()));
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "الصيانة والدعم الفني") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n الصيانة والدعم الفني",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "نقل البضائع") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n نقل البضائع",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "الخدمات المشتركة") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n الخدمات المشتركة",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "المسافات الطويلة") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n المسافات الطويلة",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "البنية الأساسية") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n البنية الأساسية",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "السلامة والجودة") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n السلامة والجودة",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "الشئون المالية") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n الشئون المالية",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "المشروعات الهندسية والتطوير") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n المشروعات الهندسية والتطوير",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "الاحتياجات") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات قطاع\n المشتريات والمخازن",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "المراجعة الداخلية والفحص") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات إدارة\n المراجعة الداخلية والفحص",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     } else if (usersection == "الإدارة العامة للأمن") {
//       return Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(children: [
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(2.0),
//                 child: GestureDetector(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height / 3,
//                     width: MediaQuery.of(context).size.width / 1.5,
//                     padding: EdgeInsets.all(5),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         border: Border.all(
//                           color: borderColor,
//                           width: 3.0,
//                         ),
//                         borderRadius: BorderRadius.circular(100.0),
//                         gradient: LinearGradient(colors: [
//                           Colors.blueAccent,
//                           Colors.indigo,
//                         ]),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               blurRadius: 2.0,
//                               offset: Offset(2.0, 2.0))
//                         ]),
//                     margin: EdgeInsets.all(2),
//                     child: AutoSizeText(
//                         maxLines: 2,
//                         "قرارات \nوتعليمات عامة",
//                         textDirection: TextDirection.rtl,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: colorText,
//                         )),
//                   ),
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (BuildContext context) =>
//                             GlobalDecisionIndex()));
//                     setState(() {});
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width / 1.5,
//                   padding: EdgeInsets.all(5),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       color: Colors.blueAccent,
//                       border: Border.all(
//                         color: borderColor,
//                         width: 3.0,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       gradient: LinearGradient(colors: [
//                         Color(0xFFd4ab99),
//                         Color(0xFF755e5e),
//                       ]),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 2.0,
//                             offset: Offset(2.0, 2.0))
//                       ]),
//                   margin: EdgeInsets.all(2),
//                   child: AutoSizeText(
//                       maxLines: 2,
//                       "تعليمات\n الإدارة العامة للأمن",
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: colorText,
//                       )),
//                 ),
//                 onTap: () {
//                   itemUnavailablePopUp(context);
//                 },
//               ),
//             )
//           ]));
//     }
//   }
// }
// decision varaity
}

// Training
class HomeItemPageBuilderTrainings extends StatefulWidget {
  @override
  State<HomeItemPageBuilderTrainings> createState() =>
      _HomeItemPageBuilderTrainingsState();
}

class _HomeItemPageBuilderTrainingsState
    extends State<HomeItemPageBuilderTrainings> {
  final borderColor = Color.fromRGBO(49, 39, 79, 1);

  final colorText = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  child: AutoSizeText(
                maxLines: 2,
                "لم يتم اضافتها بعد\nانتظرونا قريباً",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ));

    // Padding(
    //     padding: EdgeInsets.all(8),
    //     child: ListView(children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(5),
    //             child: GestureDetector(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (BuildContext context) =>
    //                             AdministrativeTrainingIndex()));
    //               },
    //               child: Container(
    //                   height: MediaQuery.of(context).size.height / 4,
    //                   padding: EdgeInsets.all(5),
    //                   alignment: Alignment.centerRight,
    //                   decoration: BoxDecoration(
    //                       color: Colors.blueAccent,
    //                       border: Border.all(
    //                         color: borderColor,
    //                         width: 3.0,
    //                       ),
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       gradient: LinearGradient(
    //                           colors: [Colors.indigo, Colors.blueAccent]),
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 2.0,
    //                             offset: Offset(2.0, 2.0))
    //                       ]),
    //                   margin: EdgeInsets.all(2),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       AutoSizeText(
    //                           maxLines: 1,
    //                           "الـتـدريــب الإداري",
    //                           textDirection: TextDirection.rtl,
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                             color: colorText,
    //                           )),
    //                       Spacer(
    //                         flex: 1,
    //                       ),
    //                       Image(
    //                         width: MediaQuery.of(context).size.width / 3,
    //                         matchTextDirection: true,
    //                         image: AssetImage(
    //                           "assets/images/Administrative_Training.png",
    //                         ),
    //                       ),
    //                     ],
    //                   )),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(5),
    //             child: GestureDetector(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (BuildContext context) =>
    //                             BlueCallerTrainingIndex()));
    //               },
    //               child: Container(
    //                   height: MediaQuery.of(context).size.height / 4,
    //                   padding: EdgeInsets.all(5),
    //                   alignment: Alignment.centerRight,
    //                   decoration: BoxDecoration(
    //                       color: Colors.blueAccent,
    //                       border: Border.all(
    //                         color: borderColor,
    //                         width: 3.0,
    //                       ),
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       gradient: LinearGradient(
    //                           colors: [Colors.indigo, Colors.blueAccent]),
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 2.0,
    //                             offset: Offset(2.0, 2.0))
    //                       ]),
    //                   margin: EdgeInsets.all(2),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       AutoSizeText(
    //                           maxLines: 1,
    //                           "الـتـدريــب التشغيلي",
    //                           textDirection: TextDirection.rtl,
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                             color: colorText,
    //                           )),
    //                       Spacer(
    //                         flex: 1,
    //                       ),
    //                       Image(
    //                         width: MediaQuery.of(context).size.width / 3,
    //                         matchTextDirection: true,
    //                         image: AssetImage(
    //                           "assets/images/BlueWorker_training.png",
    //                         ),
    //                       ),
    //                     ],
    //                   )),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(5),
    //             child: GestureDetector(
    //               onTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (BuildContext context) =>
    //                             SkillTrainingIndex()));
    //               },
    //               child: Container(
    //                   height: MediaQuery.of(context).size.height / 4,
    //                   padding: EdgeInsets.all(5),
    //                   alignment: Alignment.centerRight,
    //                   decoration: BoxDecoration(
    //                       color: Colors.blueAccent,
    //                       border: Border.all(
    //                         color: borderColor,
    //                         width: 3.0,
    //                       ),
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       gradient: LinearGradient(
    //                           colors: [Colors.indigo, Colors.blueAccent]),
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.grey,
    //                             blurRadius: 2.0,
    //                             offset: Offset(2.0, 2.0))
    //                       ]),
    //                   margin: EdgeInsets.all(2),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       AutoSizeText(
    //                           maxLines: 1,
    //                           "المهارات الشخصية",
    //                           textDirection: TextDirection.rtl,
    //                           style: TextStyle(
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.bold,
    //                             color: colorText,
    //                           )),
    //                       Spacer(
    //                         flex: 1,
    //                       ),
    //                       Image(
    //                         width: MediaQuery.of(context).size.width / 3,
    //                         matchTextDirection: true,
    //                         image: AssetImage(
    //                           "assets/images/Skills_Training.png",
    //                         ),
    //                       ),
    //                     ],
    //                   )),
    //             ),
    //           )
    //         ],
    //       ),
    //     ]));
  }
}

class HomeItemPageBuilderJobDescription extends StatefulWidget {
  @override
  _HomeItemPageBuilderJobDescriptionState createState() =>
      _HomeItemPageBuilderJobDescriptionState();
}

class _HomeItemPageBuilderJobDescriptionState
    extends State<HomeItemPageBuilderJobDescription> {
  final borderColor = Color.fromRGBO(49, 39, 79, 1);

  final colorText = Color.fromARGB(255, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  child: AutoSizeText(
                maxLines: 2,
                "لم يتم اضافتها بعد\nانتظرونا قريباً",
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ));
  }
}
