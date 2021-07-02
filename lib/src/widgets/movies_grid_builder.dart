import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../model/movie_result.dart';
import '../resources/movie_strings.dart';
import '../ui/movie_details_page.dart';
import 'movie_hero.dart';

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
          child: MovieHero(
            imageUrl: '${MovieStrings.gridBuilderImageUrlStart}'
                '${moviesResults[index].posterPath}',
            imageFit: BoxFit.cover,
            heroTag: '${moviesResults[index].posterPath}',
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
