import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/src/resources/movies_repository.dart';
import 'package:movies/src/utils/testing_constants.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:movies/src/bloc/movies_bloc.dart';
import 'package:movies/src/model/movie.dart';
import 'package:movies/src/ui/movies_page.dart';

import 'build_widget.dart';
import 'movies_page_test.mocks.dart';

@GenerateMocks(
  [
    MoviesBloc,
    MoviesRepository,
  ],
)
void main() {
  late MoviesBloc bloc;
  late Movie movie;
  late MockMoviesRepository repository;

  setUp(
    () {
      movie = Movie(
        page: TestingConstants.defaultIndex,
        results: TestingConstants.defaultMovieArray,
        totalPages: TestingConstants.defaultIndex,
        totalResults: TestingConstants.defaultIndex,
      );

      repository = MockMoviesRepository();
      bloc = MoviesBloc(repository);

      when(
        repository.fetchAllMovies(),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );

  testWidgets(
    'Testing home page',
    (test) async {
      await test.runAsync(
        () async {
          await mockNetworkImagesFor(
            () => test.pumpWidget(
              buildWidget(
                MoviesPage(
                  title: 'Trending Movies',
                  bloc: bloc,
                ),
              ),
            ),
          );
          bloc.fetchTrendingMovies();
        },
      );

      await test.pump();

      expect(
        find.byType(
          GridView,
        ),
        findsOneWidget,
      );
    },
  );
}
