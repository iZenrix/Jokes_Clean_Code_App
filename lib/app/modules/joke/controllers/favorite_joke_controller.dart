import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/cache_manager_mixin.dart';
import 'package:jokes_app/app/data/models/joke_model.dart';

class FavoriteJokeController extends GetxController with CacheManager{
  RxList<Joke> favoriteJokes = <Joke>[].obs;

  @override
  void onInit() {
    favoriteJokes.addAll(getFavoriteJokes());
    super.onInit();
  }

  void removeFromFavorites(Joke joke) async {
    joke.isFavorite = false;
    favoriteJokes.remove(joke);
    await saveFavoriteJokes(favoriteJokes);
  }
}