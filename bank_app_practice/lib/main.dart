import 'dart:io';
import 'package:bank_app_practice/app/initializeApp.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';



Future<void> permission() async {
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var sdkInt = androidInfo.version.sdkInt; // SDK, example: 31

    await [
      Permission.notification,
      Permission.storage,
    ].request();
    if (sdkInt >= 30) {
      await Permission.manageExternalStorage.request();
    } else {
      await [
        Permission.manageExternalStorage,
      ].request();
    }
  } else if (Platform.isIOS) {
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      final result = await Permission.notification.request();
      if (result.isGranted) {
        print('Notification permission granted');
      } else {
        print('Notification permission not granted');
      }
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}
