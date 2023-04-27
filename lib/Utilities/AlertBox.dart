import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../Pages/HomePages/Form/formPage.dart';

class NotAccess extends StatelessWidget {
  const NotAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CupertinoAlertDialog(
        title: Text(
          "Not Verified!",
          style: kSourcesansProBold.copyWith(color: Colors.red, fontSize: 25),
        ),
        content: Column(children: const [
          Text(
            "Register Your Self from Homepage => Registration Form",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color.fromARGB(255, 70, 66, 66)),
          )
        ]),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const RegistrationForm(url: registrationForm)),
                    );
                  },
                  child: const Text("Register"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
