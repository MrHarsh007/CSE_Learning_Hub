import 'package:cse_learning_hub/Pages/HomePages/Paper/subject_page.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Pages/drawer.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:cse_learning_hub/main.dart';

import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../StudyMaterial/show_iteam_page.dart';

class PaperPages extends StatefulWidget {
  const PaperPages({super.key});

  @override
  State<PaperPages> createState() => _PaperPagesState();
}

class _PaperPagesState extends State<PaperPages> {
  bool loading = true;

  List<dynamic> myData = [];

  fetchSemesters() async {
    final response = await http.get(Uri.parse(papersJson));

    if (response.statusCode == 200) {
      setState(() {
        myData = json.decode(response.body)['Papers'];

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
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      body: loading
          ? const CircularProgressIndicator(
              color: Colors.blueAccent,
              value: 100,
            ).centered()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: myData.length,
              itemBuilder: (BuildContext ctx, index) {
                final String name = myData[index]['name'];
                final List sourceData = myData[index]["source"];

                // final String sourceImage =
                //     myData[index]["source"][index]["image"];
                return GestureDetector(
                  onTap: () {
                    print("$sourceData");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowPaper(data: sourceData)),
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
                        child: Center(
                            child: Text(
                          name,
                          style: kSourcesansProBold.copyWith(fontSize: 20),
                        ))),
                  ),
                );
              }),
    ));
  }
}
