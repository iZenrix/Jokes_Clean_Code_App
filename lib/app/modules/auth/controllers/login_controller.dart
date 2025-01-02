import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/auth_mixin.dart';
import 'package:jokes_app/app/data/models/login/login_request_model.dart';
import 'package:jokes_app/app/modules/auth/views/onboard.dart';

class LoginController extends GetxController with AuthMixin {
  RxBool obscureText = true.obs;

  Future<void> loginUser(String email, String password) async {
    final response = await authProvider
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      authController.login(response.token);
      Get.to(const OnBoard());
    } else {
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
