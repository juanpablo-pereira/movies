import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../model/movie_result.dart';
import '../resources/movie_strings.dart';
import '../ui/movie_details_page.dart';

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
        return InkWell(
          child: Image.network(
            '${MovieStrings.gridBuilderImageUrlStart + moviesResults[index].posterPath}',
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsPage(
                  moviesResults[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
