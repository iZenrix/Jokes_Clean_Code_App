import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/auth_mixin.dart';
import 'package:jokes_app/app/data/models/register/register_request_model.dart';
import 'package:jokes_app/app/modules/auth/views/onboard.dart';

class RegisterController extends GetxController with AuthMixin {
  Future<void> registerUser(String email, String password) async {
    final response = await authProvider
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null) {
      authController.login(response.token);
      Get.to(const OnBoard());
    } else {
      Get.defaultDialog(
        middleText: 'Register Error',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
