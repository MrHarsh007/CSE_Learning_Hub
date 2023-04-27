import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:cse_learning_hub/Pages/HomePages/StudyMaterial/show_iteam_page.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class SemPages extends StatefulWidget {
  const SemPages({super.key});

  @override
  State<SemPages> createState() => _SemPagesState();
}

class _SemPagesState extends State<SemPages> {
  bool loading = true;

  List<dynamic> myData = [];

  fetchSemesters() async {
    final response = await http.get(Uri.parse(semesterJson));

    if (response.statusCode == 200) {
      setState(() {
        myData = json.decode(response.body)['semester'];

        setState(() {
          loading = false;
        });
      });

      // return myData.map((json) => Semester.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load semesters');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSemesters();
    Timer.periodic(const Duration(seconds: 5), (_) => fetchSemesters());
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      body: loading
          ? const CircularProgressIndicator(
              color: Colors.blueAccent,
              value: 100,
            ).centered()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                maxCrossAxisExtent: 300,
                // childAspectRatio: 3 / 2.5,
              ),
              itemCount: myData.length,
              itemBuilder: (BuildContext ctx, index) {
                final String name = myData[index]['name'];
                final String icon = myData[index]['icon'];
                final String desc = myData[index]['desc'];
                final List sourceData = myData[index]["source"];
                final String sourceImage =
                    myData[index]["source"][index]["image"];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowIteam(data: sourceData)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: boxesColor[index],
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.5 * kHorizontalPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: ClipRRect(
                              child: Image.network(icon

                                  // color: Color.fromARGB(255, 62, 59, 59),
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  name,
                                  style:
                                      kSourcesansProBold.copyWith(fontSize: 22),
                                ),
                                AutoSizeText(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  desc,
                                  style: kSourcesansProRegular.copyWith(
                                      fontSize: 16),
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    ));
  }
}
