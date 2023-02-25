import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:unique_identifier/unique_identifier.dart';
import '../../Pages/HomePages/HomePage.dart';
import '../../config.dart';
import '../appUpdate/appUpdate.dart';

const url = accessJson;

bool Verified = false;
String name = "User";

class CheckUser {
  static Future<bool?> readJson() async {
    final response = await http.get(Uri.parse(url));
    final catJson = response.body;
    var decodeData = jsonDecode(catJson);

    Map<String, dynamic> jsonData = jsonDecode(catJson);

    //Check user is existed in our data or not
    bool elementExists =
        jsonData['Users'].any((item) => item['serial'] == SerialKey);
    if (elementExists) {
      Verified = true;
      print("Serial number $SerialKey exist in the JSON data.");

      //Retreiving Name of user using serialKey
      name = jsonData['Users']
          .firstWhere((item) => item['serial'] == SerialKey)['name'];
      print("UserName: $name");
    } else {
      Verified = false;
      print("Serial number $SerialKey does not exist in the JSON data.");
    }

    return response.statusCode == 200 ? Verified : null;
  }
}
