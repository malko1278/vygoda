
import 'package:flutter/material.dart';

class ScreenPageView extends StatefulWidget {
  const ScreenPageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<ScreenPageView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      color: Colors.white,
      margin: const EdgeInsets.only(top: 4.0),
    );
  }
}