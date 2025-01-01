import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/value/color.dart';
import 'package:jokes_app/app/modules/auth/views/components/header.dart';
import 'package:jokes_app/app/modules/joke/controllers/joke_controller.dart';

class JokeView extends GetView<JokeController> {
  final String? jokeType;

  JokeView({super.key, this.jokeType});

  @override
  final JokeController controller = Get.put(JokeController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    controller.getOneJokes(jokeType!);
    return Scaffold(
      appBar: AppBar(
        title: Header(
          text: 'jokes type: $jokeType'.capitalizeFirst!,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Obx(
                () {
                  return controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.jokes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(controller.jokes[index].setup),
                              subtitle: Text(controller.jokes[index].punchline),
                              trailing: IconButton(
                                icon: Obx(
                                  () => Icon(
                                    controller.jokes[index].isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: controller.jokes[index].isFavorite
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                                onPressed: () {
                                  if (controller.jokes[index].isFavorite) {
                                    controller.removeFromFavorites(
                                        controller.jokes[index]);
                                  } else {
                                    controller.addToFavorites(
                                        controller.jokes[index]);
                                  }
                                  controller.jokes.refresh();
                                },
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.primary),
                onPressed: () {
                  controller.getTenJokes(jokeType!);
                },
                child: const Center(
                  child: Text(
                    'Generate 10 Jokes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
