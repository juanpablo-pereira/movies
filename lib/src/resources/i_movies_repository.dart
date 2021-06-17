import 'movies_api_provider.dart';
import '../model/movie.dart';

abstract class IMoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<Movie> fetchAllMovies();
  Future<Movie> fetchMovieSearch(String keywords);
}
