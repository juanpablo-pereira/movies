import 'dart:async';

import '../model/movies_model.dart';
import '../resources/movies_repository.dart';
import 'i_movies_bloc.dart';

class MoviesBloc extends IMoviesBloc {
  MoviesRepository _moviesRepository = MoviesRepository();
  StreamController<MoviesModel> _moviesStreamController = StreamController();

  @override
  void initialize() {}

  @override
  void dispose() {
    this._moviesStreamController.close();
  }

  @override
  void fetchMovies() async {
    final movieList = await _moviesRepository.fetchAllMovies();
    this._moviesStreamController.sink.add(
          movieList,
        );
  }

  @override
  Stream<MoviesModel> get stream => this._moviesStreamController.stream;
}
