import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/value/color.dart';
import 'package:jokes_app/app/modules/auth/controllers/login_controller.dart';
import 'package:jokes_app/app/modules/auth/views/components/footer.dart';
import 'package:jokes_app/app/modules/auth/views/components/header.dart';
import 'package:jokes_app/app/modules/auth/views/register_view.dart';
import 'package:jokes_app/app/modules/auth/views/components/background.dart' as bg;

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: Stack(
          children: [
            bg.bgTop(context),
            bg.bgBottom(context),
            SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    child: Form(
                      key: loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Header(
                              text: 'Login',
                            ),
                          ),
                          const SizedBox(height: 50),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              labelText: 'youremail@example.com',
                              hintText: 'email',
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              labelText: 'password',
                              hintText: 'password',
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () async {
                              if (loginFormKey.currentState
                                      ?.validate() ??
                                  false) {
                                await controller.loginUser(
                                  controller.emailController.text,
                                  controller.passwordController.text,
                                );
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Footer(
                            text: 'Dont Have an Account?',
                            textButton: 'Register',
                            onPressed: (){
                              Get.to(RegisterView());
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
