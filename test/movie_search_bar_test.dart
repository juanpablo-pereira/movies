import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/src/bloc/movies_bloc.dart';
import 'package:movies/src/model/movie.dart';
import 'package:movies/src/utils/testing_constants.dart';
import 'package:movies/src/widgets/movie_seach_bar.dart';

import 'build_widget.dart';
import 'movies_page_test.mocks.dart';

void main() {
  late MockMoviesRepository repository;
  late MoviesBloc bloc;
  late Movie movie;
  setUp(
    () {
      repository = MockMoviesRepository();
      bloc = MoviesBloc(
        repository,
      );
      movie = Movie(
        page: TestingConstants.defaultIndex,
        results: TestingConstants.defaultMovieArray,
        totalPages: TestingConstants.defaultIndex,
        totalResults: TestingConstants.defaultIndex,
      );

      when(
        repository.fetchAllMovies(),
      ).thenAnswer(
        (_) async => movie,
      );
    },
  );

  testWidgets(
    'Testing search bar',
    (tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            buildWidget(
              Scaffold(
                body: MovieSearchBar(
                  bloc: bloc,
                ),
              ),
            ),
          );
        },
      );
      await tester.pump();

      expect(
        find.byType(
          TextField,
        ),
        findsOneWidget,
      );
    },
  );
}
