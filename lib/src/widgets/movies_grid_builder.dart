import 'package:flutter/material.dart';
import 'package:movie_widgets/movie_widgets.dart';

import '../resources/movie_strings.dart' as Local;
import '../utils/pages_dimensions.dart';
import '../model/movie_result.dart';
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
        crossAxisCount: PagesDimensions.gridBuilderCrossAxisCount,
        mainAxisExtent: PagesDimensions.gridBuilderMainAxisExtent,
      ),
      itemCount: moviesResults.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: MovieHero(
            imageUrl: '${Local.MovieStrings.gridBuilderImageUrlStart}'
                '${moviesResults[index].posterPath}',
            imageFit: BoxFit.cover,
            heroTag: moviesResults[index].posterPath,
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
