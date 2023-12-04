import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jokes_app/app/modules/auth/views/components/error_view.dart';
import 'package:jokes_app/app/modules/auth/views/components/waiting_view.dart';
import 'package:jokes_app/app/modules/auth/views/onboard.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  Future<void> initializeSettings() async {
    controller.checkLoginStatus();
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return const OnBoard();
          }
        }
      },
    );
  }
}

