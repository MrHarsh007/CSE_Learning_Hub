import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RegistrationForm extends StatelessWidget {
  final String url;
  const RegistrationForm({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: url,
        ),
      ),
    );
  }
}
