import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/value/color.dart';
import 'package:jokes_app/app/modules/auth/views/components/header.dart';
import 'package:jokes_app/app/modules/joke/controllers/joke_controller.dart';

class FavoritesPage extends GetView<JokeController> {
  FavoritesPage({super.key});

  @override
  final JokeController controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Header(text: 'Favorite Jokes', color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Obx(
          () {
            var groupedJokes = groupBy(controller.favoriteJokes, (joke) => joke.type);
            return ListView.builder(
              itemCount: groupedJokes.keys.length,
              itemBuilder: (context, index) {
                var type = groupedJokes.keys.elementAt(index);
                var jokes = groupedJokes[type];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        type.capitalizeFirst!,
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.primary),
                      ),
                    ),
                    ...jokes!.map(
                      (joke) => ListTile(
                        title: Text(joke.setup),
                        subtitle: Text(joke.punchline),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            controller.removeFromFavorites(joke);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
