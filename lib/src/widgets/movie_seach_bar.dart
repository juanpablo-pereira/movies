import 'package:flutter/material.dart';

import '../bloc/movies_bloc.dart';
import '../utils/movie_dimensions.dart';

class MovieSearchBar extends StatelessWidget {
  const MovieSearchBar({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final MoviesBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MovieDimensions.appBarTextFieldHeight,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: MovieDimensions.appBarTextFieldHint,
          filled: MovieDimensions.appBarTextFieldIsFilled,
          fillColor: Colors.blueGrey.shade100,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade100,
              width: MovieDimensions.appBarTextFieldBorderWidth,
            ),
          ),
          suffixIcon: Icon(
            Icons.search,
          ),
          contentPadding: EdgeInsets.all(
            MovieDimensions.appBarTextFieldContentPadding,
          ),
        ),
        onSubmitted: (query) {
          this.bloc.fetchMoviesBySearch(
                query,
              );
        },
      ),
    );
  }
}
