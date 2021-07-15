import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/model/movie_result.dart';
import 'package:movies/src/resources/movie_strings.dart';
import 'package:movies/src/ui/movie_details_page.dart';
import 'package:movies/src/utils/testing_constants.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'build_widget.dart';

void main() {
  late MovieResult exampleResult;

  setUp(
    () {
      exampleResult = MovieResult(
        id: TestingConstants.defaultIndex,
        voteAverage: TestingConstants.defaultMovieVoteAverage,
        title: MovieStrings.defaultTitle,
        posterPath: TestingConstants.defaultString,
        genreIds: TestingConstants.defaultArray,
        adult: false,
        overview: MovieStrings.defaultOverview,
        releaseDate: MovieStrings.defaultReleaseDate,
      );
    },
  );

  testWidgets(
    'Testing details widget',
    (test) async {
      mockNetworkImagesFor(
        () async {
          await test.pumpWidget(
            buildWidget(
              MovieDetailsPage(
                exampleResult,
              ),
            ),
          );

          expect(
            find.descendant(
              of: find.byType(
                Hero,
              ),
              matching: find.byType(
                Image,
              ),
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              exampleResult.title,
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              exampleResult.overview,
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              exampleResult.releaseDate,
            ),
            findsOneWidget,
          );

          expect(
            find.text(
              exampleResult.voteAverage.toString(),
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
