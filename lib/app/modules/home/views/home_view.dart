import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/value/color.dart';
import 'package:jokes_app/app/core/value/constant.dart';
import 'package:jokes_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jokes_app/app/modules/auth/views/components/header.dart';
import 'package:jokes_app/app/modules/joke/views/favorite_joke_view.dart';
import 'package:jokes_app/app/modules/joke/views/joke_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final AuthController _authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _authC.logOut();
          },
          icon: const Icon(Icons.logout_rounded, color: Colors.black,),
        ),
        centerTitle: true,
        title: const Header(text: 'Joke App', color: Colors.black,),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.black,),
            onPressed: () {
              Get.to(() => FavoritesPage());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: GridView.count(
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          children: List.generate(Constant.jokeTypes.length, (index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => JokeView(jokeType: Constant.jokeTypes[index]));
              },
              child: Card(
                color: CustomColor.primary,
                child: Center(
                  child: Text(
                    Constant.jokeTypes[index].capitalizeFirst!,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

