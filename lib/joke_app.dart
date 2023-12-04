import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/theme/app_theme.dart';
import 'package:jokes_app/app/routes/app_pages.dart';

class JokeApp extends StatelessWidget {
  const JokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: appTheme,
    );
  }
}
