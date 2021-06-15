import 'dart:async';

import '../model/movies_model.dart';
import 'bloc.dart';

abstract class IMoviesBloc extends Bloc {
  Stream<MoviesModel> get stream;

  void fetchMovies();
}
