import 'package:get/get.dart';

import '../controllers/joke_controller.dart';

class JokeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JokeController>(
      () => JokeController(),
    );
  }
}
