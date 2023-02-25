import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Pages/contactUs.dart';
import 'App Style/app_style.dart';
import 'appUpdate/appUpdate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

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

        // IconButton(
        //   icon:
        // Image.asset(
        //   "assets/menu.png",
        //   scale: 2.7,
        // ),
        // onPressed: () => launch("https://www.instagram.com/hrporwal_007"),
        // ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocialMediaPage()),
              );
            },
            child: Image.asset(
              "assets/profile.png",
              scale: 2,
            ),
          )
        ],
      ),
    );
  }
}
