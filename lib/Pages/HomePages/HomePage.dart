import 'package:auto_size_text/auto_size_text.dart';
import 'package:cse_learning_hub/Pages/HomePages/Form/formPage.dart';
import 'package:cse_learning_hub/Pages/HomePages/Paper/sem_pages.dart';
import 'package:cse_learning_hub/Pages/HomePages/Projects/project.dart';
import 'package:cse_learning_hub/Pages/contactUs.dart';
import 'package:cse_learning_hub/Utilities/Serial Number/checkUser.dart';
import 'package:cse_learning_hub/Utilities/Serial Number/serialGenerator.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Pages/HomePages/StudyMaterial/sem_pages.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/size_config.dart';
import 'package:cse_learning_hub/Utilities/appBar.dart';
import 'package:cse_learning_hub/Utilities/appUpdate/appUpdate.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

bool nightMode = false;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String image = "assets/computer.svg";

  @override
  void initState() {
    super.initState();
    // verifyUser();
    // verifyCode();

    // showDialoge();
  }

  // Future showDialoge() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool hasOpenedBefore = prefs.getBool('hasOpenedBefore') ?? false;
  //   if (!hasOpenedBefore) {
  //     await prefs.setBool('hasOpenedBefore', true);
  //     // ignore: use_build_context_synchronously
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             icon: Icon(Icons.search),
  //             alignment: Alignment.center,
  //             title: Text("Welcome to CSE Learning Hub"),
  //             content: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const Text(
  //                     "1. We have Change our name from GTU Material App to CSE Learning Hub",
  //                     textAlign: TextAlign.start,
  //                   ),
  //                   const Text(
  //                     "2. All user have to register it self for accesing our material.",
  //                     textAlign: TextAlign.start,
  //                   ),
  //                   const Text(
  //                     "3. User can Register it self from our HomeScreen there is form for Registration.",
  //                     textAlign: TextAlign.start,
  //                   )
  //                 ]),
  //           );
  //         });
  //     setState(() {});
  //   }
  // }

  // Future verifyCode() async {
  //   SerialKey = await generateUniqueCode();
  //   print(SerialKey);
  //   setState(() {});
  // }

  // Future verifyUser() async {
  //   (await CheckUser.readJson())!;
  //   (Verified)
  //       ? print("UserVerified in HomePage : $SerialKey")
  //       : print("User Does not Verified in HomePage : $SerialKey");
  //   setState(() {});
  // }

  Future<void> shareAPK() async {
    await FlutterShare.share(
        title: 'Welcome to CSE Learning Hub',
        text:
            "Greetings and welcome to the CSE Learning Hub!\n\nOur platform is designed to provide valuable resources for CS/IT degree students,including access to GTU previous years papers and DE reports. We understand that these materials can be incredibly helpful in furthering your education, and we're here to make that process as seamless as possible.\n\nTo access our extensive collection of materials, we kindly request that you register yourself through our convenient Registration form, which is available on our HomeScreen. This will grant you full access to our library of resources and allow you to benefit from the wide range of educational content that we have to offer.\n\nYour Serial Key, which is essential for accessing our materials, is available on the HomeScreen in a bold, blue color. We encourage you to take advantage of this opportunity to expand your knowledge and enhance your academic success.\n\nThank you for choosing the CSE Learning Hub!!",
        linkUrl: downloadLink,
        chooserTitle: 'CSE Learning Hub');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(kHorizontalPadding / 1.8),
              child: SizedBox(
                height: SizeConfig.screenHeight! / 4.5,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                          decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    Positioned(
                      height: 120,
                      top: SizeConfig.blockSizeHorizontal! * 5,
                      left: SizeConfig.blockSizeVertical! * 2.3,
                      child: SvgPicture.asset(
                        fit: BoxFit.contain,
                        image,
                        color: Colors.black,
                        semanticsLabel: "Logo",
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.blockSizeVertical! * 1.5,
                      bottom: SizeConfig.blockSizeVertical! * 1.5,
                      right: SizeConfig.blockSizeVertical! * 1.5,
                      left: SizeConfig.blockSizeHorizontal! * 35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText("Hello, $name",
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              minFontSize: 18,
                              style: kSourcesansProBold),
                          Text(
                            "Welcome to CSE\nLearning Hub",
                            style: kSourcesansProRegular.copyWith(
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 4.5),
                          ),

                          (!Verified)
                              ? SelectableText(
                                  "SerialKey : $SerialKey",
                                  style: kSourcesansProBold.copyWith(
                                      fontWeight: FontWeight.w800,
                                      // fontStyle: FontStyle.italic,
                                      // color: Color.fromARGB(179, 162, 38, 31),
                                      color: const Color.fromARGB(
                                          255, 10, 64, 109),
                                      fontSize: 20),
                                )
                              : AutoSizeText(
                                  "✅ Access Granted!",
                                  maxLines: 1,
                                  style: kSourcesansProBold.copyWith(
                                    fontWeight: FontWeight.w700,
                                    // fontStyle: FontStyle.italic,
                                    // color: Color.fromARGB(179, 162, 38, 31),
                                    color:
                                        const Color.fromARGB(255, 10, 64, 109),
                                  ),
                                )

                          // Text(
                          //   "User Verified : $Verified",
                          //   style: kSourcesansProRegular.copyWith(
                          //       fontSize: SizeConfig.blockSizeHorizontal! * 4),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SemPages()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 211, 226, 236),
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.my_library_books,
                              size: 40,
                            ),
                            AutoSizeText(
                              "Study Material",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "CS/IT Material",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    // onTap: () => launch(
                    //     "https://drive.google.com/drive/folders/1H2NZHe9wDkaQBe739P3TuXICiXQqRjke?usp=share_link"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaperPages()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightYellow,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.paperplane_fill,
                              size: 40,
                            ),
                            AutoSizeText(
                              "GTU Papers",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "CS/IT Papers",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    // onTap: () => launch("https://forms.gle/jsGbjaPEBS1MQMRr6"),
                    onTap: () {
                      (!Verified)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistrationForm(
                                      url: registrationForm)),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                elevation: 5,
                                duration: const Duration(milliseconds: 600),
                                backgroundColor:
                                    const Color.fromARGB(255, 134, 176, 197),
                                content:
                                    Text('$name you Already Registered Once!!',
                                        style: kSourcesansProBold.copyWith(
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.fade),
                              ),
                            );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightGreen,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.app_registration_rounded,
                              size: 40,
                            ),
                            AutoSizeText(
                              "Registration Form",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "Single Time",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RegistrationForm(url: feedbackForm)),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightRed,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.format_align_justify_rounded,
                              size: 40,
                            ),
                            AutoSizeText(
                              "FeedBack Form",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "Means Alot!",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectPages()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightYellow,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.picture_in_picture_alt_outlined,
                              size: 40,
                            ),
                            AutoSizeText(
                              "DE Projects",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "Only Samples",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launch(textBookLink);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightBlue,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.picture_in_picture_alt_outlined,
                              size: 40,
                            ),
                            AutoSizeText(
                              "Text Book",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "CS/IT Text book",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SocialMediaPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightRed,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              CupertinoIcons.profile_circled,
                              size: 40,
                            ),
                            AutoSizeText(
                              "Contact Us",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "Harsh Porwal",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => shareAPK(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kLightGreen,
                          borderRadius: BorderRadius.circular(kBorderRadius)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.3 * kHorizontalPadding),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share_rounded,
                              size: 40,
                            ),
                            AutoSizeText(
                              "Share APK",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: kSourcesansProBold.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            AutoSizeText(
                              "Share With Friends ",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: kSourcesansProRegular.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String message) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(message),
    actions: [
      TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
