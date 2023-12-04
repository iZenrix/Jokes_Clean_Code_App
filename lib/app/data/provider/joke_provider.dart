import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jokes_app/app/core/value/constant.dart';
import 'package:jokes_app/app/data/models/joke_model.dart';

class JokeProvider {
  Future<Joke> fetchOneJoke(String type) async {
    var jokeList = await _fetchJokes('${Constant.jokeUrl}/$type/random');
    return Joke.fromJson(jokeList[0]);
  }

  Future<List<Joke>> fetchTenJokes(String type) async {
    var jokeList = await _fetchJokes('${Constant.jokeUrl}/$type/ten');
    return jokeList.map((joke) => Joke.fromJson(joke)).toList();
  }

  Future<List<dynamic>> _fetchJokes(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List;
    } else {
      throw Exception('Failed to load jokes');
    }
  }
}
