import 'package:cse_learning_hub/Pages/HomePages/Projects/project.dart';
import 'package:cse_learning_hub/Pages/splashScreen.dart';
import 'package:cse_learning_hub/Utilities/AlertBox.dart';
import 'package:cse_learning_hub/Utilities/appUpdate/appUpdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
        child: Scaffold(
          body: AppUpdate(),
        ),
      ),
    );
  }
}
