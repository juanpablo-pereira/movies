import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../model/movie.dart';
import 'movie_strings.dart';

class MoviesApiProvider {
  Client client = Client();

  Future<Movie> fetchAllMovies() async {
    final query = "${MovieStrings.apiFetchPopular}"
        "${MovieStrings.apiKey}";
    return _getMovies(query);
  }

  Future<Movie> fetchMovieSearch(String keywords) async {
    final query = "${MovieStrings.apiFetchSearch}"
        "${MovieStrings.apiKey}"
        "${MovieStrings.apiSearchParam}"
        "$keywords";
    return _getMovies(query);
  }

  Future<Movie> _getMovies(String query) async {
    final response = await client.get(
      Uri.parse(
        "$query",
      ),
    );
    if (response.statusCode == 200) {
      return Movie.fromJson(
        json.decode(
          response.body,
        ),
      );
    }
    throw Exception(
      'Failed to load movies',
    );
  }
}
