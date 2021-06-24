import 'dart:async';

import '../model/movie.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<Movie> _moviesStreamController = StreamController();

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {
    _moviesStreamController.close();
  }

  @override
  void fetchTrendingMovies() async {
    final movieList = await _moviesRepository.fetchAllMovies();
    _addFetchedMovies(
      movieList,
    );
  }

  @override
  void fetchMoviesBySearch(String movieKeywords) async {
    if (movieKeywords.isNotEmpty) {
      final movieList = await _moviesRepository.fetchMovieSearch(
        movieKeywords,
      );
      _addFetchedMovies(
        movieList,
      );
    } else {
      fetchTrendingMovies();
    }
  }

  void _addFetchedMovies(Movie movies) {
    _moviesStreamController.sink.add(
      movies,
    );
  }

  @override
  Stream<Movie> get stream => _moviesStreamController.stream;
}
