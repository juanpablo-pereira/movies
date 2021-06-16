import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../model/movies_result_model.dart';

class MoviesGridBuilder extends StatelessWidget {
  const MoviesGridBuilder(
    this.moviesResults, {
    Key key,
  }) : super(key: key);

  final List<MoviesResultModel> moviesResults;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Constants.gridBuilderCrossAxisCount,
        mainAxisExtent: Constants.gridBuilderMainAxisExtent,
      ),
      itemCount: moviesResults.length,
      itemBuilder: (context, index) {
        return Image.network(
          '${Constants.gridBuilderImageUrlStart + moviesResults[index].posterPath}',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
