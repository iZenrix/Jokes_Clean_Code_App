import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/data/provider/auth_provider.dart';
import 'package:jokes_app/app/modules/auth/controllers/auth_controller.dart';

mixin AuthMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final AuthProvider _authProvider = AuthProvider();
  late final AuthController _authController = Get.find<AuthController>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  AuthProvider get authProvider => _authProvider;
  AuthController get authController => _authController;
}
