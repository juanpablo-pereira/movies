import 'dart:async';

import '../model/movie.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<Movie> get stream;

  void fetchTrendingMovies();
  void fetchMoviesBySearch(String movieKeywords);
}
