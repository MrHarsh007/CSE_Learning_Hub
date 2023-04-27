import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:flutter/material.dart';

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: 60.0,
                      height: 60.0,
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   // color: Colors.black,
                      // ),
                      child: Image.asset(
                        "assets/cse.png",
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'CSE Learning Hub',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Positioned(
            bottom: 55.0,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Center(
                child: Text(
              "Created By => Harsh Porwal",
              style: kSourcesansSemiBold.copyWith(
                  fontSize: 15, color: Colors.black87),
            )),
          ),
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
