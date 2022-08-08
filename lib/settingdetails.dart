import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SettingDetails extends StatefulWidget {
  @override
  _SettingDetailsState createState() => _SettingDetailsState();
}

class _SettingDetailsState extends State<SettingDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Lottie.asset('asset/news.json')),
      ),
    );
  }
}
