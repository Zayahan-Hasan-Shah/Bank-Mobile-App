import 'dart:async';

import 'package:bank_app_practice/app/app.dart';
import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/noGlowBehaviour.dart';
import 'package:bank_app_practice/core/theme.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  late StreamSubscription<List<ConnectivityResult>>? connectionStream;

  /// for connectivity check
  Future<void> checkConnectivity() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      noInternetSnackBar();
    }
    connectionStream = Connectivity().onConnectivityChanged.listen((
      connection,
    ) {
      if (connection.contains(ConnectivityResult.none)) {
        noInternetSnackBar();
      }
    });
  }

  @override
  void initState() {
    checkConnectivity();

    const androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    const initailizationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      ),
    );
    _localNotifications.initialize(initailizationSettings);
    super.initState();
  }

  @override
  void dispose() {
    connectionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: appTheme(),
        title: 'TransferMe Bank',
        debugShowCheckedModeBanner: false,
        scrollBehavior: NoGlowBehavior(),
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.mainRoute,
        navigatorObservers: [NavigatorObserver()],
        navigatorKey: App.navigatorKey,
        builder: (context, child) {
          return child!;
        },
      ),
    );
  }

  void noInternetSnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = App.navigatorKey.currentState?.context;
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ColorsPallete.errorColor,
            content: TitleText(
              title: noInternetMessage,
              fontSize: 14,
              weight: FontWeight.normal,
              color: ColorsPallete.white,
            ),
          ),
        );
      }
    });
  }
}
