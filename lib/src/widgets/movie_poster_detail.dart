import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../resources/movie_strings.dart';
import 'movie_hero.dart';

class MoviePosterDetail extends StatelessWidget {
  const MoviePosterDetail({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MovieDimensions.paddingVerticalMedium,
        ),
        Center(
          child: MovieHero(
            imageUrl: '${MovieStrings.gridBuilderImageUrlStart + imagePath}',
            imageFit: BoxFit.fitWidth,
            heroTag: '$imagePath',
            height: MovieDimensions.detailsImageHeight,
            width: MovieDimensions.detailsImageWidth,
          ),
        ),
      ],
    );
  }
}
