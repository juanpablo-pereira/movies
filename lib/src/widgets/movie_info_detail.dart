import 'package:flutter/material.dart';

import '../utils/movie_dimensions.dart';
import '../resources/movie_strings.dart';

class MovieInfoDetail extends StatelessWidget {
  const MovieInfoDetail({
    Key? key,
    required this.title,
    required this.releaseDate,
    required this.isForAdults,
    required this.overview,
  }) : super(key: key);

  final String title;
  final String releaseDate;
  final bool isForAdults;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MovieDimensions.paddingVerticalSmall,
        ),
        Text(
          '$title',
          style: TextStyle(
            fontSize: MovieDimensions.fontSizeLarge,
            color: Colors.grey.shade50,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: MovieDimensions.paddingVerticalSmall,
        ),
        SizedBox(
          height: MovieDimensions.detailsSubtitleHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$releaseDate',
                style: TextStyle(
                  fontSize: MovieDimensions.fontSizeXSmall,
                  color: Colors.grey.shade200,
                ),
              ),
              VerticalDivider(
                width: MovieDimensions.paddingHorizontalMedium,
                thickness: MovieDimensions.detailsDividerThickness,
                color: Colors.grey.shade200,
              ),
              Text(
                '${isForAdults ? MovieStrings.detailsIsAdultText : MovieStrings.detailsIsNotAdultText}',
                style: TextStyle(
                  fontSize: MovieDimensions.fontSizeXSmall,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MovieDimensions.paddingVerticalMedium,
        ),
        SizedBox(
          width: MovieDimensions.detailsContentWidth,
          child: Text(
            '$overview',
            style: TextStyle(
              fontSize: MovieDimensions.fontSizeMedium,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ],
    );
  }
}
