import 'dart:io';

import 'package:device_info/device_info.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> generateUniqueCode() async {
  String deviceId = "";
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    var build = await deviceInfo.androidInfo;
    deviceId = build.androidId;
  } else if (Platform.isIOS) {
    var data = await deviceInfo.iosInfo;
    deviceId = data.identifierForVendor;
  }
  var bytes = utf8.encode(deviceId);
  var digest = sha1.convert(bytes);
  var hash = digest.toString().substring(0, 5);
  return hash;
}
