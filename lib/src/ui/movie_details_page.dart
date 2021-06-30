import 'package:flutter/material.dart';

import '../model/movie_result.dart';
import '../utils/movie_dimensions.dart';
import '../widgets/movie_info_detail.dart';
import '../widgets/movie_poster_detail.dart';
import '../widgets/movie_rating_detail.dart';

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
        toolbarHeight: MovieDimensions.detailsAppBarHeight,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviePosterDetail(
              imagePath: data.posterPath,
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
