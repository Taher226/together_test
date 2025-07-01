import 'dart:async';

import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('orgList');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.neutral100),
      body: Container(
        color: AppColors.neutral100,
        padding: EdgeInsets.only(bottom: 50),
        child: Center(
          child: Image.asset(
            'images/logo.png',
            width: MediaQuery.of(context).size.width * 0.808,
            height: MediaQuery.of(context).size.height * 0.199,
          ),
        ),
      ),
    );
  }
}
