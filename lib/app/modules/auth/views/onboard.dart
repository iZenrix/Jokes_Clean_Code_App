import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jokes_app/app/modules/auth/views/login_view.dart';
import 'package:jokes_app/app/modules/home/views/home_view.dart';

class OnBoard extends GetView<AuthController> {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLogged.value ? HomeView() : LoginView();
    });
  }
}