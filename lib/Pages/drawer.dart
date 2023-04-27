import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();

    // verifyUser();
  }

  // bool verify = false;
  // Future verifyUser() async {
  //   verify = (await CheckUser.readJson())!;
  //   setState(() {});
  //   print("UserVerified in Drawer : $verify");
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.red[400],
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: "Harsh Porwal ".text.xl.bold.make(),
                  accountEmail: EmailAddress.text.white.capitalize
                      .caption(context)
                      .make(),
                  currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/profile.jpg")),
                ),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.mail_solid,
                  color: Colors.white,
                ),
                title: const Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                onTap: () => launch("mailto:{$EmailAddress}"),
              ),
              ListTile(
                leading: const Icon(
                  SocialIconsFlutter.instagram,
                  color: Colors.white,
                ),
                title: const Text(
                  "Instagram",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                onTap: () => launch("https://www.instagram.com/hrporwal_007/"),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.ant,
                  color: Colors.white,
                ),
                title: const Text(
                  "Serial Number",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const SerialHome(),
                //         ));
                //   },
              ),
              ListTile(
                  leading: const Icon(
                    CupertinoIcons.app,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "GTU - Paper",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textScaleFactor: 1.3,
                  ),
                  onTap: () => launch(
                      "https://drive.google.com/drive/folders/1H2NZHe9wDkaQBe739P3TuXICiXQqRjke?usp=share_link")),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
                title: const Text(
                  "Contact Us",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textScaleFactor: 1.3,
                ),
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => const SocialMediaPage(),
                //       ));
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
