import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../model/movie_result.dart';
import '../resources/movie_strings.dart';

class MoviesGridBuilder extends StatelessWidget {
  const MoviesGridBuilder(
    this.moviesResults, {
    Key? key,
  }) : super(key: key);

  final List<MovieResult> moviesResults;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MovieDimensions.gridBuilderCrossAxisCount,
        mainAxisExtent: MovieDimensions.gridBuilderMainAxisExtent,
      ),
      itemCount: moviesResults.length,
      itemBuilder: (context, index) {
        return Image.network(
          '${MovieStrings.gridBuilderImageUrlStart + moviesResults[index].posterPath}',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
