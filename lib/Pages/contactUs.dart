import 'dart:convert';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({super.key});

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            backgroundColor: Colors.grey[100],
            title: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                "Contact Us",
                style: kSourcesansProBold.copyWith(fontSize: 22),
              ),
            ),
            foregroundColor: Colors.black,
            toolbarOpacity: 0.8,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () => Navigator.pop(context),
            )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                height: 200,
                width: 200,
                child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 100,
                    child: Image.asset("assets/profilecirc.png")),
              ),
              20.heightBox,
              "Harsh Porwal".text.semiBold.xl2.make(),
              5.heightBox,
              InkWell(
                child: EmailAddress.text.base.xl.caption(context).make(),
                onTap: () => launch("mailto:{$EmailAddress}"),
              ),
              20.heightBox,
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () => launch("https://github.com/MrHarsh007"),
                    title: const Text("GitHub"),
                    leading: const Icon(SocialIconsFlutter.github),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  10.heightBox,
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () => launch("mailto:$EmailAddress"),
                    title: const Text("Email"),
                    leading: const Icon(CupertinoIcons.mail),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  10.heightBox,
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () => launch("https://twitter.com/HarshPorwal29"),
                    title: const Text("Twitter"),
                    leading: const Icon(SocialIconsFlutter.twitter),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  10.heightBox,
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () =>
                        launch("https://www.instagram.com/hrporwal_007"),
                    title: const Text("Instagram"),
                    leading: const Icon(SocialIconsFlutter.instagram),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  10.heightBox,
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () => launch(
                        "https://linkedin.com/in/harsh-porwal-708645213"),
                    title: const Text("LinkedIn"),
                    leading: const Icon(SocialIconsFlutter.linkedin),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                  10.heightBox,
                  ListTile(
                    tileColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () => openEmail(
                        toEmail: EmailAddress,
                        subject: "Add Your Material to Application",
                        body:
                            "Your Name :  \nYour WhatsApp Number : \nSemester : \nSubject Name With Code :  \nYour CollegeName : \n\nNote :- Attach Your Material With this E-mail"),
                    title: const Text("Add Your Material"),
                    leading: const Icon(CupertinoIcons.book),
                    trailing: const Icon(Icons.arrow_right_alt_outlined),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

openEmail(
    {required String toEmail, required String subject, required String body}) {
  final url =
      "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}";
  launch(url);
}
