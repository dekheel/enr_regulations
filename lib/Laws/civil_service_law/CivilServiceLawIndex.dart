import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Laws/civil_service_law/CivilServiceLaw.dart';
import 'package:enr_regulations/Widgets/ImageItems_Preview.dart';
import 'package:enr_regulations/Widgets/Itemlist_Law_Regulation.dart';
import 'package:enr_regulations/Widgets/NavigationDrawer.dart';
import 'package:enr_regulations/Widgets/TextItems_Preview.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:enr_regulations/Laws/laws.dart';
import 'package:flutter/material.dart';

class CivilServiceLawIndex extends StatefulWidget {
  @override
  State<CivilServiceLawIndex> createState() => _CivilServiceLawIndexState();
}

class _CivilServiceLawIndexState extends State<CivilServiceLawIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 170, 219),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            civil_service_law[0]["name"].toString(),
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MysearchDelegate());
              },
              icon: const Icon(Icons.search))
        ],
        backgroundColor: Color.fromRGBO(49, 39, 79, 1),
        elevation: 30,
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
        titleSpacing: 0,
      ),
      drawer: const NavigationDrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
                .15,
                Container(
                    // height: 110,
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          civil_service_law[0]["brief"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "رقم ${civil_service_law[0]["no"]} ${civil_service_law[0]["date"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ))),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: ListView.builder(
                itemCount: civil_ServiceLaw_content.length,
                itemBuilder: (BuildContext context, int index) {
                  if (civil_ServiceLaw_content[index].image == null) {
                    return FadeAnimation(
                      .15,
                      Column(
                        children: [
                          new makeItem_Laws_Regulations(
                              numberItem:
                                  civil_ServiceLaw_content[index].number,
                              section: civil_ServiceLaw_content[index].section,
                              title: civil_ServiceLaw_content[index].title,
                              goToDetailPage: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ItemPreview(
                                              bookTitle: civil_service_law[0]
                                                  ["name"],
                                              detail: civil_ServiceLaw_content[
                                                      index]
                                                  .detail,
                                              section: civil_ServiceLaw_content[
                                                      index]
                                                  .section,
                                              title: civil_ServiceLaw_content[
                                                      index]
                                                  .title,
                                              number: civil_ServiceLaw_content[
                                                      index]
                                                  .number,
                                            )));
                              }),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return FadeAnimation(
                      .15,
                      Column(
                        children: [
                          new makeItem_Laws_Regulations(
                              numberItem:
                                  civil_ServiceLaw_content[index].number,
                              section: civil_ServiceLaw_content[index].section,
                              title: civil_ServiceLaw_content[index].title,
                              goToDetailPage: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            imagePreview(
                                              subjectTitle: civil_service_law[0]
                                                  ["name"],
                                              section: civil_ServiceLaw_content[
                                                      index]
                                                  .section,
                                              title: civil_ServiceLaw_content[
                                                      index]
                                                  .title,
                                              image: civil_ServiceLaw_content[
                                                      index]
                                                  .image,
                                              number: civil_ServiceLaw_content[
                                                      index]
                                                  .number,
                                              detail: civil_ServiceLaw_content[
                                                      index]
                                                  .detail,
                                            )));
                              }),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class to search in list

class MysearchDelegate extends SearchDelegate {
  List<CivilServiceLaw> searchResults = civil_ServiceLaw_content;

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: const Icon(Icons.close))
      ];

  @override
  Widget buildResults(BuildContext context) => Center();
  var input;
  var result;
  @override
  Widget buildSuggestions(BuildContext context) {
    List<CivilServiceLaw> suggestions = searchResults.where((searchResult) {
      result = searchResult.detail;
      input = query;

      return result.contains(input);
    }).toList();
    return suggestions.isNotEmpty
        ? ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];

              return ListTile(
                title: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 47, 37, 78).withOpacity(.70),
                        Color.fromARGB(255, 47, 37, 78).withOpacity(.90),
                        // WE NEED ON CLICK
                        // Color.fromARGB(255, 9, 112, 0).withOpacity(.70),
                        // Color.from ARGB(255, 5, 63, 0).withOpacity(.70),
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        suggestion.title,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        suggestion.section,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,

                        style: TextStyle(
                            color: Colors.amber[800],
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.right
                      )
                    ],
                  ),
                ),
                onTap: () {
                  // query = suggestion.title;
                  showResults(context);
                  if (suggestion.image != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => imagePreview(
                              subjectTitle: civil_service_law[0]["name"],
                              section: suggestion.section,
                              title: suggestion.title,
                              image: suggestion.image,
                              number: suggestion.number,
                              detail: suggestion.detail,
                              searchInput: input,
                            )));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ItemPreview(
                              bookTitle: civil_service_law[0]["name"],
                              detail: suggestion.detail,
                              section: suggestion.section,
                              title: suggestion.title,
                              number: suggestion.number,
                              searchInput: input,
                            )));
                  }
                },
              );
            })
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/No_Results_Found.png"),
                  Text(
                    "لا توجد نتائج تطابق عملية البحث",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 77, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  Text("رجاء المحاولة مجدداً",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 77, 0, 0),
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
  }
}
