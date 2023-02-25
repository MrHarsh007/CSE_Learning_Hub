import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:cse_learning_hub/Utilities/Serial%20Number/checkUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // ignore: sort_child_properties_last
        child: Stack(children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
            child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/cse.png",
                      height: 40,
                      width: 50,
                    ),
                    Text(
                      "CSE Learning Hub",
                      style: kSourcesansProBold.copyWith(fontSize: 30),
                    )
                  ],
                )),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 8),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Created By => Harsh Porwal",
                style: kSourcesansSemiBold.copyWith(
                    fontSize: 15, color: Colors.black54),
              ),
            ),
          )
        ]),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                kLightBlue, kLightGreen, Color.fromARGB(255, 187, 156, 109),
                kLightOrange
                //add more colors for gradient
              ],
              begin: Alignment.topLeft, //begin of the gradient color
              end: Alignment.bottomRight, //end of the gradient color
              stops: [0, 1, 0.3, 0.8] //stops for individual color
              //set the stops number equal to numbers of color
              ),
        ),
      ),
    );
  }
}
