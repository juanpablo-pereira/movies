import 'movies_api_provider.dart';
import '../model/movies_model.dart';

class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();
  Future<MoviesModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}
