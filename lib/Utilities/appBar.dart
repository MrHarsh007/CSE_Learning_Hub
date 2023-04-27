import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Pages/contactUs.dart';
import 'App Style/app_style.dart';
import 'appUpdate/appUpdate.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CSE Learning Hub",
            style:
                kSourcesansProBold.copyWith(fontSize: 22, color: Colors.black)),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () async {
            await FlutterShare.share(
                title: 'Welcome to CSE Learning Hub',
                text:
                    "Greetings and welcome to the CSE Learning Hub!\n\nOur platform is designed to provide valuable resources for CS/IT degree students,including access to GTU previous years papers and DE reports. We understand that these materials can be incredibly helpful in furthering your education, and we're here to make that process as seamless as possible.\n\nTo access our extensive collection of materials, we kindly request that you register yourself through our convenient Registration form, which is available on our HomeScreen. This will grant you full access to our library of resources and allow you to benefit from the wide range of educational content that we have to offer.\n\nYour Serial Key, which is essential for accessing our materials, is available on the HomeScreen in a bold, blue color. We encourage you to take advantage of this opportunity to expand your knowledge and enhance your academic success.\n\nThank you for choosing the CSE Learning Hub!!",
                linkUrl: downloadLink,
                chooserTitle: 'CSE Learning Hub');
          },
          child: const Icon(
            Icons.ios_share,
            color: Colors.black,
            semanticLabel: ("Share"),
          ),
        ),
        actions: [
          CupertinoSwitch(
            trackColor: Colors.black,
            value: nightMode,
            onChanged: (value) {
              setState(() {
                nightMode ? nightMode = false : nightMode = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 800),
                    backgroundColor: const Color.fromARGB(255, 181, 209, 228),
                    content: Row(
                      children: const [
                        Icon(Icons.mobile_friendly, color: Colors.black),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Enable/Disable dark mode in PDF with this switch.',
                            style: TextStyle(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    elevation: 5,
                  ),
                );
                print("$nightMode");
              });
            },
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const SocialMediaPage()),
          //     );
          //   },
          //   child: Image.asset(
          //     "assets/profile.png",
          //     scale: 2,
          //   ),
          // )
        ],
      ),
    );
  }
}
