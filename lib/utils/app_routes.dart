import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/presentation/home_screen.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/splash_screen.dart';
import 'package:flutter_bloc_dr/utils/app_constant.dart';

final Map<String, WidgetBuilder> appRoutes = {
  AppConstant.routeSplashScreen: (context) => const SplashScreen(),
  AppConstant.routeHomeScreen: (context) => const HomeScreen(),
};
