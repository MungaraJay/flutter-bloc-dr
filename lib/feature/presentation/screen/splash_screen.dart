import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/utils/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(AppConstant.splashDuration, () {
      Navigator.pushReplacementNamed(context, AppConstant.routeHomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: FlutterLogo(size: 100)));
  }
}
