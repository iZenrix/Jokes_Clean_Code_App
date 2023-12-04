import 'package:get/get.dart';
import 'package:jokes_app/app/data/models/joke_model.dart';
import 'package:jokes_app/app/data/provider/joke_provider.dart';

class JokeController extends GetxController {
  var isLoading = true.obs;
  var jokeTypes = ['general', 'programming', 'knock-knock', 'dad'].obs;
  var favoriteJokes = <Joke>[].obs;
  var isFav = false.obs;
  var jokes = <Joke>[].obs;

  void _fetchJokes(String type, int count) async {
    try {
      isLoading(true);
      var jokeProvider = JokeProvider();
      var results = count == 1 ? [await jokeProvider.fetchOneJoke(type)] : await jokeProvider.fetchTenJokes(type);
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

  void addToFavorites(Joke joke) {
    joke.isFavorite = true;
    favoriteJokes.add(joke);
  }

  void removeFromFavorites(Joke joke) {
    joke.isFavorite = false;
    favoriteJokes.remove(joke);
  }
}
