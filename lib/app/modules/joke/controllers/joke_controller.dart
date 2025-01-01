import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/cache_manager_mixin.dart';
import 'package:jokes_app/app/data/models/joke_model.dart';
import 'package:jokes_app/app/data/provider/joke_provider.dart';

class JokeController extends GetxController with CacheManager {
  RxBool isLoading = true.obs;
  RxList<String> jokeTypes = [
    'general',
    'programming',
    'knock-knock',
    'dad',
  ].obs;
  RxList<Joke> favoriteJokes = <Joke>[].obs;
  RxBool isFav = false.obs;
  RxList<Joke> jokes = <Joke>[].obs;

  @override
  void onInit() {
    favoriteJokes.addAll(getFavoriteJokes());
    super.onInit();
  }

  void _fetchJokes(String type, int count) async {
    try {
      isLoading(true);
      var jokeProvider = JokeProvider();
      var results = count == 1
          ? [
              await jokeProvider.fetchOneJoke(type),
            ]
          : await jokeProvider.fetchTenJokes(type);
      jokes.clear();
      for (var result in results) {
        if (!favoriteJokes.any((joke) => joke.id == result.id)) {
          jokes.add(result);
        }
      }
      if (jokes.isEmpty) {
        Get.snackbar('Info', 'Semua joke pada tipe ini telah habis.');
      }
    } finally {
      isLoading(false);
    }
  }

  void getOneJokes(String type) async {
    _fetchJokes(type, 1);
  }

  void getTenJokes(String type) async {
    _fetchJokes(type, 10);
  }

  void addToFavorites(Joke joke) async {
    joke.isFavorite = true;
    favoriteJokes.add(joke);
    await saveFavoriteJokes(favoriteJokes);
  }

  void removeFromFavorites(Joke joke) async {
    joke.isFavorite = false;
    favoriteJokes.remove(joke);
    await saveFavoriteJokes(favoriteJokes);
  }
}
