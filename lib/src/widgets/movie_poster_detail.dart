import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../resources/movie_strings.dart';

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
          child: Image.network(
            '${MovieStrings.gridBuilderImageUrlStart + imagePath}',
            fit: BoxFit.fitWidth,
            height: MovieDimensions.detailsImageHeight,
            width: MovieDimensions.detailsImageWidth,
          ),
        ),
      ],
    );
  }
}
