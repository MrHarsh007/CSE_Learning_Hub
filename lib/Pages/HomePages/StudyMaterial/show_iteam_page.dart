import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:cse_learning_hub/Utilities/AlertBox.dart';
import 'package:cse_learning_hub/Utilities/Serial%20Number/checkUser.dart';
import 'package:cse_learning_hub/Pages/drawer.dart';
import 'package:cse_learning_hub/Pages/HomePages/show_material.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Utilities/App Style/app_style.dart';

class ShowIteam extends StatefulWidget {
  final List<dynamic> data;
  const ShowIteam({super.key, required this.data});

  @override
  State<ShowIteam> createState() => _ShowIteamState();
}

class _ShowIteamState extends State<ShowIteam> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 18,
                child: CupertinoSwitch(
                  value: nightMode,
                  onChanged: (value) {
                    setState(() {
                      nightMode ? nightMode = false : nightMode = true;
                      print("$nightMode");
                    });
                  },
                ),
              ),
              const Positioned(
                  bottom: 0,
                  child: Text(
                      softWrap: true,
                      textAlign: TextAlign.center,
                      "Click Here to Enable and Disable Night mode in PDF.")),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,

          appBar: const CustomAppBar(),
          body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.data.length,
              itemBuilder: (BuildContext ctx, index) {
                final String sourceName = widget.data[index]['name'];
                final String sourceDesc = widget.data[index]['desc'];
                final String sourceSyllabus = widget.data[index]['syllabus'];
                final String sourceMaterial = widget.data[index]['material'];
                final String sourceImage = widget.data[index]['image'];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    // height: 400,
                    // width: SizeConfig.screenWidth! / 2,
                    decoration: BoxDecoration(
                        // color: const Color.fromARGB(255, 211, 226, 236),
                        color: boxesColor[index],
                        borderRadius: BorderRadius.circular(kBorderRadius)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0.3 * kHorizontalPadding,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sourceName,
                              textAlign: TextAlign.center,
                              // overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              sourceDesc,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProMedium.copyWith(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => (Verified)
                                                ? ShowMaterial(
                                                    sourceMaterial:
                                                        sourceMaterial)
                                                : NotAccess())),
                                    child: Text(
                                      "Material",
                                      style: kSourcesansSemiBold.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 100,
                                  child: ElevatedButton(
                                      onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ShowMaterial(
                                                      sourceMaterial:
                                                          sourceSyllabus),
                                            ),
                                          ),
                                      child: Text("Syllabus",
                                          style: kSourcesansSemiBold.copyWith(
                                              fontSize: 14))),
                                ),
                                const SizedBox(
                                  height: 7,
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                );
              }),

          // ListView.builder(
          //   itemCount: widget.data.length,
          //   itemBuilder: (context, index) {
          //     final name = widget.data[index]["syllabus"];
          //     return Text(name);
          //   },
          // ),
        ),
      ),
    );
  }
}
