import 'package:flutter/material.dart';
import 'package:movie_widgets/movie_widgets.dart';

import '../model/movie_result.dart';
import '../utils/pages_dimensions.dart';
import '../resources/movie_strings.dart' as Local;

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(
    this.data, {
    Key? key,
  }) : super(key: key);

  final MovieResult data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: PagesDimensions.detailsAppBarHeight,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviePosterDetail(
              imagePath:
                  Local.MovieStrings.gridBuilderImageUrlStart + data.posterPath,
            ),
            MovieInfoDetail(
              title: data.title,
              releaseDate: data.releaseDate,
              isForAdults: data.adult,
              overview: data.overview,
            ),
            MovieRatingDetail(
              voteAverage: data.voteAverage,
            ),
          ],
        ),
      ),
    );
  }
}
