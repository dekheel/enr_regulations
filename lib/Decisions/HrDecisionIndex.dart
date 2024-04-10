import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Decisions/Decision_ImageItems_Preview.dart';
import 'package:enr_regulations/Decisions/Decisions.dart';
import 'package:enr_regulations/Widgets/Itemlist_Decisions.dart';
import 'package:enr_regulations/Widgets/NavigationDrawer.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class HrDecisionIndex extends StatefulWidget {
  @override
  State<HrDecisionIndex> createState() => _HrDecisionIndexState();
}

class _HrDecisionIndexState extends State<HrDecisionIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 170, 219),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: AutoSizeText(
            maxLines: 1,
            "تعليمات الموارد البشرية",
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
          children: [
            Expanded(
                child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                itemCount: HR_Decisions.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                    .15,
                    Column(
                      children: [
                        new makeItem_Decisions(
                            image: HR_Decisions[index].image,
                            number: HR_Decisions[index].number,
                            title: HR_Decisions[index].title,
                            date: HR_Decisions[index].date,
                            goToDetailPage: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DecisionimagePreview(
                                            title: HR_Decisions[index].title,
                                            image: HR_Decisions[index].image,
                                          )));
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future refresh() async {
    Center(child: CircularProgressIndicator());
    await Future.delayed(Duration(seconds: 2));
    ListView.builder(
      itemCount: HR_Decisions.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeAnimation(
          .15,
          Column(
            children: [
              new makeItem_Decisions(
                  image: HR_Decisions[index].image,
                  number: HR_Decisions[index].number,
                  title: HR_Decisions[index].title,
                  date: HR_Decisions[index].date,
                  goToDetailPage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DecisionimagePreview(
                                  title: HR_Decisions[index].title,
                                  image: HR_Decisions[index].image,
                                )));
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}

//class to search in list

class MysearchDelegate extends SearchDelegate {
  List searchResults = HR_Decisions;

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
    List suggestions = searchResults.where((searchResult) {
      result = searchResult.title;
      input = query;

      return result.contains(input);
    }).toList();
    return result.contains(input)
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
                      AutoSizeText(
                        maxLines: 1,
                        suggestion.title,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      AutoSizeText(
                        maxLines: 1,

                        suggestion.number + " " + suggestion.date,
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

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DecisionimagePreview(
                            title: suggestion.title,
                            image: suggestion.image,
                          )));
                },
              );
            })
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/No_Results_Found.png"),
                AutoSizeText(
                  maxLines: 1,
                  "لا توجد نتائج تطابق عملية البحث",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 77, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                    maxLines: 1,
                    "رجاء المحاولة مجدداً",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 77, 0, 0),
                        fontWeight: FontWeight.bold)),
              ],
            ),
          );
  }
}
