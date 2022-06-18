import 'dart:async';
import 'dart:developer' as logger;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/crypto_repository.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/order_book_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_cubit.dart';
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

  final CryptoCubit cryptoCubit = CryptoCubit(CryptoRepository());
  final OrderBookCubit orderBookCubit = OrderBookCubit(OrderBookRepository());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CryptoCubit>(create: (_) => cryptoCubit),
          BlocProvider<OrderBookCubit>(create: (_) => orderBookCubit),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: AppColor.colorBlue,
                fontFamily: AppConstant.fontFamilyLato),
            initialRoute: AppConstant.routeSplashScreen,
            title: 'Flutter App',
            routes: appRoutes));
  }
}
