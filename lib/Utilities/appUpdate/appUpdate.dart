import 'dart:convert';
import 'dart:ui';
import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:cse_learning_hub/Pages/splashScreen.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:unique_identifier/unique_identifier.dart';
import '../Serial Number/checkUser.dart';
import '../Serial Number/serialGenerator.dart';
import 'downloadLink.dart';
import 'package:package_info_plus/package_info_plus.dart';

String downloadLink = "";
String SerialKey = "";

class AppUpdate extends StatefulWidget {
  const AppUpdate({
    Key? key,
  }) : super(key: key);

  @override
  AppUpdateState createState() => AppUpdateState();
}

class AppUpdateState extends State<AppUpdate> {
  static var currentVersion = "";

  late bool _isLoading;

  Future init() async {
    downloadLink = (await DownloadLink.getDownloadLink())!;
  }

  var latestVersion;
  getData() async {
    final url = Uri.parse(
        "https://cselearninghub.github.io/CseMaterial/appVersion.json");
    var req = await http.get(url);
    latestVersion = json.decode(req.body);
    print(latestVersion['serial']);

    return latestVersion['serial'];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      setState(() {
        latestVersion = value;
      });
    });
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 3500), () {
      setState(() {
        _isLoading = false;
      });
    });
    PackageInformation();
    init();
    verifyCode();
    verifyUser();
  }

  Future verifyCode() async {
    SerialKey = await generateUniqueCode();
    print(SerialKey);
    setState(() {});
  }

  Future verifyUser() async {
    (await CheckUser.readJson())!;
    (Verified)
        ? print("UserVerified in AppUpdate : $SerialKey")
        : print("User Does not Verified in AppUpdate : $SerialKey");
    setState(() {});
  }

  PackageInformation() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    currentVersion = packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_isLoading)
          ? const SplashScreen()
          : (latestVersion == currentVersion)
              ? const HomePage()
              : Scaffold(
                  backgroundColor: Colors.red.shade300,
                  body: AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 180),
                    backgroundColor: Colors.red.shade100,
                    icon: SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/cse.png")),
                    title: const Center(
                        child: Text(
                      "NEW UPDATE AVAILABLE",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w900),
                    )),
                    content: Column(children: [
                      const Text(
                        "CSE Learning Hub",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      10.heightBox,
                      Center(
                        child: Text(
                            "Latest Version Available: ${latestVersion}",
                            style:
                                const TextStyle(fontWeight: FontWeight.w400)),
                      ),
                      10.heightBox,
                      // Text(
                      //   "Click Here to Update Application",
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      Text(
                        "Current Version : $currentVersion",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w300),
                      ),
                      10.heightBox,
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[400])),
                          onPressed: () {
                            launch(downloadLink);
                          },
                          child: const Text("Download")),
                      8.heightBox,
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red[400])),
                          onPressed: () => launch("https://wa.me/918460946542"),
                          child: const Text("Contact Us"))
                    ]),
                  ),
                ),

      // )

      // ListView.builder(
      //   itemCount: _items.length,
      //   itemBuilder: (context, index) {
      //     serial = _items[index]["serial"];
      //     return (serial == currentVersion)
      //         ? SizedBox(
      //             height: MediaQuery.of(context).size.height,
      //             child: const SerialPage())
      //         : AlertDialog(
      //             backgroundColor: Colors.grey[200],
      //             actions: [
      //               Text(
      //                 "Version : $currentVersion",
      //                 style: const TextStyle(
      //                     color: Colors.grey, fontWeight: FontWeight.bold),
      //               )
      //             ],
      //             icon: SizedBox(
      //                 height: 100,
      //                 width: 100,
      //                 child: Image.asset("assets/cyberCrime.png")),
      //             title: const Center(
      //                 child: Text(
      //               "NEW UPDATE AVAILABLE",
      //               style: TextStyle(
      //                   color: Colors.red, fontWeight: FontWeight.w900),
      //             )),
      //             content: Column(children: [
      //               const Text(
      //                 "Cyber Crime Cell : Ahmedabad Police",
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //               10.heightBox,
      //               Text("Latest Version Available: ${serial}",
      //                   style: TextStyle(fontWeight: FontWeight.w200)),
      //               // 10.heightBox,
      //               // Text(
      //               //   "Click Here to Update Application",
      //               //   style: TextStyle(fontWeight: FontWeight.bold),
      //               // ),
      //               10.heightBox,
      //               ElevatedButton(
      //                   onPressed: () {
      //                     launch(downloadLink);
      //                   },
      //                   child: const Text("Download")),
      //               8.heightBox,
      //               ElevatedButton(
      //                   onPressed: () => launch("https://wa.me/919426832103"),
      //                   child: const Text("Contact Us"))
      //             ]),
      //           );
      //   },
      // ),
    );
  }
}
