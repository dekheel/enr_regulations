import 'package:auto_size_text/auto_size_text.dart';
import 'package:enr_regulations/Regulations/Hr_Regulation/Hr_Regulations.dart';
import 'package:enr_regulations/Regulations/Regulations.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Itemlist_Penalty_Regulation.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Penalty_Regulation.dart';
import 'package:enr_regulations/Regulations/penalty_regulation/Penalty_Regulation_TextItems_Preview.dart';
import 'package:enr_regulations/Widgets/NavigationDrawer.dart';
import 'package:enr_regulations/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class PenaltyRegulationIndex extends StatefulWidget {
  @override
  State<PenaltyRegulationIndex> createState() => _PenaltyRegulationIndexState();
}

class _PenaltyRegulationIndexState extends State<PenaltyRegulationIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 170, 219),
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text(
            penalty_regulation_detail[0]["name"],
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
                          penalty_regulation_detail[0]["brief"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          "رقم ${penalty_regulation_detail[0]["no"]} الصادره بتاريخ ${penalty_regulation_detail[0]["date"]}",
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
            Expanded(
                child: RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                itemCount: Penalty_Regulation_content.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                    .15,
                    Column(
                      children: [
                        new makeItem_Penalty_Regulation(
                            numberItem:
                                Penalty_Regulation_content[index].number,
                            section: Penalty_Regulation_content[index].section,
                            title: Penalty_Regulation_content[index].title,
                            chapter: Penalty_Regulation_content[index].chapter,
                            goToDetailPage: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Item_Penalty_regulation_Preview(
                                            bookTitle:
                                                penalty_regulation_detail[0]
                                                    ["name"],
                                            detail: Penalty_Regulation_content[
                                                    index]
                                                .detail,
                                            section: Penalty_Regulation_content[
                                                    index]
                                                .section,
                                            title: Penalty_Regulation_content[
                                                    index]
                                                .title,
                                            number: Penalty_Regulation_content[
                                                    index]
                                                .number,
                                            chapter: Penalty_Regulation_content[
                                                    index]
                                                .chapter,
                                            penalty_group:
                                                Penalty_Regulation_content[
                                                        index]
                                                    .penalty_group,
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
      itemCount: hr_regulation_content.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeAnimation(
          .15,
          Column(
            children: [
              new makeItem_Penalty_Regulation(
                  numberItem: Penalty_Regulation_content[index].number,
                  section: Penalty_Regulation_content[index].section,
                  title: Penalty_Regulation_content[index].title,
                  chapter: Penalty_Regulation_content[index].chapter,
                  goToDetailPage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Item_Penalty_regulation_Preview(
                                  bookTitle: penalty_regulation_detail[0]
                                      ["name"],
                                  detail:
                                      Penalty_Regulation_content[index].detail,
                                  section:
                                      Penalty_Regulation_content[index].section,
                                  title:
                                      Penalty_Regulation_content[index].title,
                                  number:
                                      Penalty_Regulation_content[index].number,
                                  chapter:
                                      Penalty_Regulation_content[index].chapter,
                                  penalty_group:
                                      Penalty_Regulation_content[index]
                                          .penalty_group,
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
  List<Penalty_Regulation> searchResults = Penalty_Regulation_content;

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
    List<Penalty_Regulation> suggestions = searchResults.where((searchResult) {
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
                        suggestion.chapter,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,

                        style: TextStyle(
                            color: Colors.amber[800],
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.right
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Item_Penalty_regulation_Preview(
                            bookTitle: penalty_regulation_detail[0]["name"],
                            detail: suggestion.detail,
                            section: suggestion.section,
                            chapter: suggestion.chapter,
                            title: suggestion.title,
                            number: suggestion.number,
                            searchInput: input,
                            penalty_group: suggestion.penalty_group,
                          )));
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
