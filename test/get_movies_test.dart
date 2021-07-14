import 'package:flutter_test/flutter_test.dart';

import 'package:movies/src/model/movie.dart';
import 'package:movies/src/resources/movies_api_provider.dart';
import 'package:movies/src/utils/testing_constants.dart';

void main() {
  late MoviesApiProvider apiProvider;
  setUp(
    () {
      apiProvider = MoviesApiProvider();
    },
  );
  group(
    'Fetch of the movies',
    () {
      test(
        'Search movies by keywords',
        () async {
          Movie movie = await apiProvider.fetchMovieSearch(
            TestingConstants.movieSearchKeyword,
          );
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );
      test(
        'Get all movies',
        () async {
          Movie movie = await apiProvider.fetchAllMovies();
          expect(
            movie.results,
            isNotEmpty,
          );
        },
      );
    },
  );
}
