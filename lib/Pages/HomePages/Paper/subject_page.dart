import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:cse_learning_hub/Pages/HomePages/Paper/show_year.dart';
import 'package:cse_learning_hub/Utilities/Serial%20Number/checkUser.dart';
import 'package:cse_learning_hub/Pages/drawer.dart';
import 'package:cse_learning_hub/Pages/HomePages/show_material.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowPaper extends StatefulWidget {
  final List<dynamic> data;

  const ShowPaper({super.key, required this.data});

  @override
  State<ShowPaper> createState() => _ShowPaperState();
}

class _ShowPaperState extends State<ShowPaper> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Positioned(
              //   bottom: 18,
              //   child: CupertinoSwitch(
              //     value: nightMode,
              //     onChanged: (value) {
              //       setState(() {
              //         nightMode ? nightMode = false : nightMode = true;
              //         print("$nightMode");
              //       });
              //     },
              //   ),
              // ),
              // const Positioned(
              //     bottom: 0,
              //     child: Text(
              //         softWrap: true,
              //         textAlign: TextAlign.center,
              //         "Click Here to Enable and Disable Night mode in PDF.")),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          appBar: CustomAppBar(),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.data.length,
              itemBuilder: (BuildContext ctx, index) {
                final String subjectName = widget.data[index]['name'];
                final List papers = widget.data[index]['papers'];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      print("$papers");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowYear(
                                    paperData: papers,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 211, 226, 236),
                          color: boxesColor[index],
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0.3 * kHorizontalPadding,
                          ),
                          child: Center(
                              child: Text(
                            subjectName,
                            style: kSourcesansProBold.copyWith(fontSize: 20),
                          ))),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
