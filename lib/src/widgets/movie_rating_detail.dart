import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';

class MovieRatingDetail extends StatelessWidget {
  const MovieRatingDetail({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  final num voteAverage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MovieDimensions.paddingVerticalMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$voteAverage',
              style: TextStyle(
                fontSize: MovieDimensions.fontSizeXLarge,
                color: Colors.amber.shade300,
              ),
            ),
            Icon(
              Icons.star_border_rounded,
              color: Colors.amber.shade300,
              size: MovieDimensions.fontSizeXLarge,
            ),
          ],
        ),
      ],
    );
  }
}
