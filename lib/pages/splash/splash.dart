
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:vygoda/pages/connect/send_phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, connectRoute);
  }

  connectRoute() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const SendPhone(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/vygoda_bg.png',
              ),
              fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}