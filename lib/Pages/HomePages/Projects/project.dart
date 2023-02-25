import 'package:cse_learning_hub/Pages/HomePages/show_material.dart';
import 'package:cse_learning_hub/Utilities/AlertBox.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Pages/drawer.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:cse_learning_hub/main.dart';

import 'package:cse_learning_hub/Pages/HomePages/StudyMaterial/show_iteam_page.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Utilities/Serial Number/checkUser.dart';

class ProjectPages extends StatefulWidget {
  const ProjectPages({super.key});

  @override
  State<ProjectPages> createState() => _ProjectPagesState();
}

class _ProjectPagesState extends State<ProjectPages> {
  bool loading = true;

  List<dynamic> myData = [];

  fetchSemesters() async {
    final response = await http.get(Uri.parse(projectJson));

    if (response.statusCode == 200) {
      setState(() {
        myData = json.decode(response.body)['Project'];
        print(myData);
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
                  crossAxisSpacing: 5, mainAxisSpacing: 5, crossAxisCount: 2
                  // childAspectRatio: 3 / 2.5,
                  ),
              itemCount: myData.length,
              itemBuilder: (BuildContext ctx, index) {
                final String name = myData[index]['name'];
                final String report = myData[index]['report'];
                final String desc = myData[index]['desc'];

                return Padding(
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.center,
                                name,
                                style:
                                    kSourcesansProBold.copyWith(fontSize: 20),
                              ),
                              Text(
                                desc,
                                overflow: TextOverflow.ellipsis,
                                style: kSourcesansProMedium.copyWith(
                                    fontWeight: FontWeight.w100, fontSize: 12),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => (Verified)
                                            ? ShowMaterial(
                                                sourceMaterial: report)
                                            : const NotAccess())),
                                child: Text(
                                  "Report",
                                  style: kSourcesansSemiBold.copyWith(
                                      fontSize: 14),
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                );
              }),
    ));
  }
}
