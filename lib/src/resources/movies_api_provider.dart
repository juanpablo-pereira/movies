import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../utils/constants.dart';
import '../model/movies_model.dart';

class MoviesApiProvider {
  Client client = Client();

  Future<MoviesModel> fetchMovieList() async {
    final response = await client.get(
      "${Constants.apiFetchUrl + Constants.apiKey}",
    );

    if (response.statusCode == 200) {
      return MoviesModel.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
