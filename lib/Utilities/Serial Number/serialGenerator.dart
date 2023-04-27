import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:device_info/device_info.dart';
import 'package:unique_identifier/unique_identifier.dart';

Future<String> generateUniqueCode() async {
  String? deviceId = "";

  // Use unique_identifier package to get device ID
  try {
    deviceId = await UniqueIdentifier.serial;
  } on PlatformException {
    deviceId = 'Failed to get Serial Key';
  }

  // Generate SHA-1 hash of device ID
  var bytes = utf8.encode(deviceId!);
  var digest = sha1.convert(bytes);
  var hash = digest.toString().substring(0, 5);
  return hash;
}
