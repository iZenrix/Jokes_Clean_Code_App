import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/value/color.dart';
import 'package:jokes_app/app/modules/auth/controllers/register_controller.dart';
import 'package:jokes_app/app/modules/auth/views/components/footer.dart';
import 'package:jokes_app/app/modules/auth/views/components/header.dart';
import 'package:jokes_app/app/modules/auth/views/login_view.dart';
import 'package:jokes_app/app/modules/auth/views/components/background.dart' as bg;

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

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
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    child: Form(
                      key: registerFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Header(
                              text: 'Register',
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
                          const SizedBox(height: 15),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'confirm password',
                              hintText: 'confirm password',
                            ),
                            validator: (value) {
                              return (value == null ||
                                      value.isEmpty ||
                                      value !=
                                          controller.passwordController.text)
                                  ? 'Passwords does not match'
                                  : null;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () async {
                              if (registerFormKey.currentState
                                      ?.validate() ??
                                  false) {
                                await controller.registerUser(
                                    controller.emailController.text,
                                    controller.passwordController.text);
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Register",
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
                            text: 'Already Have an Account?',
                            textButton: 'Login',
                            onPressed: (){
                              Get.to(LoginView());
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
