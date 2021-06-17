import '../model/movie.dart';
import 'i_movies_repository.dart';

class MoviesRepository extends IMoviesRepository {
  Future<Movie> fetchAllMovies() => moviesApiProvider.fetchAllMovies();
  Future<Movie> fetchMovieSearch(String keywords) =>
      moviesApiProvider.fetchMovieSearch(keywords);
}
