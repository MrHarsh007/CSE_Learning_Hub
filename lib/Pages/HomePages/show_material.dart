import 'dart:math';

import 'package:cse_learning_hub/Pages/HomePages/HomePage.dart';
import 'package:cse_learning_hub/Utilities/App%20Style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowMaterial extends StatefulWidget {
  final String sourceMaterial;
  const ShowMaterial({
    Key? key,
    required this.sourceMaterial,
  }) : super(key: key);

  @override
  State<ShowMaterial> createState() => _ShowMaterialState();
}

class _ShowMaterialState extends State<ShowMaterial> {
  ScaffoldState? scaffold;
  @override
  void initState() {
    super.initState();
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: const Duration(milliseconds: 800),
            backgroundColor: Colors.grey,
            content: Row(
              children: const [
                Icon(Icons.remove_red_eye, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text('Rotate your device for better experience'),
              ],
            ),
            elevation: 5),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: (widget.sourceMaterial.isEmpty)
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No Data Avalaible",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[400]),
                                shape: MaterialStateProperty.all(
                                    const StadiumBorder())),
                            onPressed: () => openEmail(
                                toEmail: EmailAddress,
                                subject:
                                    "Add Material TO GTU Material Application",
                                body:
                                    "Your Name :  \nYour WhatsApp Number : \nSemester : \nSubject With Subject Code :  \nYour CollegeName :"),
                            child: const Text(
                              "Click Here To Add Your Material",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                  )
                : PDF(
                        nightMode: nightMode,
                        enableSwipe: true,
                        swipeHorizontal: true,
                        autoSpacing: false,
                        pageFling: false,
                        fitPolicy: FitPolicy.BOTH)
                    .cachedFromUrl(
                    widget.sourceMaterial,

                    maxAgeCacheObject: const Duration(hours: 24),
                    //duration of cache

                    placeholder: (progress) =>
                        Center(child: Text('$progress %')),
                    errorWidget: (error) =>
                        Center(child: Text(error.toString())),
                  )

            // PDF().cachedFromUrl(
            //   widget.sourceMaterial,

            //   maxAgeCacheObject: const Duration(hours: 24),
            //   //duration of cache

            //   placeholder: (progress) => Center(child: Text('$progress %')),
            //   errorWidget: (error) => Center(child: Text(error.toString())),
            // ),
            ));
  }
}

openEmail(
    {required String toEmail, required String subject, required String body}) {
  final url =
      "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}";
  launch(url);
}
