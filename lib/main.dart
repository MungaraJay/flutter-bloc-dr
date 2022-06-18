import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';
import 'package:flutter_bloc_dr/utils/app_constant.dart';
import 'package:flutter_bloc_dr/utils/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

  runZonedGuarded<Future<void>>(() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
      runApp(MyApp());
    });
  }, (err, trace) {
    logger.log('dart error : $err : $trace');
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: AppColor.colorBlue,
            fontFamily: AppConstant.fontFamilyLato),
        initialRoute: AppConstant.routeSplashScreen,
        title: 'Flutter App',
        routes: appRoutes);
  }
}
