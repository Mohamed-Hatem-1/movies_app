import 'dart:convert';
import 'package:movies_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchlistService {
  static const String key = 'watchlist';

  static Future<List<MovieModel>> getWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) return [];

    final List decoded = jsonDecode(data);
    return decoded.map((e) => MovieModel.fromJson(e)).toList();
  }

  static Future<void> addMovie(MovieModel movie) async {
    final prefs = await SharedPreferences.getInstance();
    final movies = await getWatchlist();

    if (movies.any((m) => m.id == movie.id)) return;

    movies.add(movie);

    prefs.setString(key, jsonEncode(movies.map((e) => e.toJson()).toList()));
  }

  static Future<void> removeMovie(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final movies = await getWatchlist();

    movies.removeWhere((m) => m.id == id);

    prefs.setString(key, jsonEncode(movies.map((e) => e.toJson()).toList()));
  }

  static Future<void> clearWatchlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
