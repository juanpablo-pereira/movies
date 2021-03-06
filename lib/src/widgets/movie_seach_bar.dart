import 'package:flutter/material.dart';

import '../bloc/movies_bloc.dart';
import '../resources/movie_strings.dart';
import '../utils/pages_dimensions.dart';

class MovieSearchBar extends StatelessWidget {
  const MovieSearchBar({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final MoviesBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PagesDimensions.appBarTextFieldHeight,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText: MovieStrings.appBarTextFieldHint,
          filled: PagesDimensions.appBarTextFieldIsFilled,
          fillColor: Colors.blueGrey.shade100,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade100,
              width: PagesDimensions.appBarTextFieldBorderWidth,
            ),
          ),
          suffixIcon: Icon(
            Icons.search,
          ),
          contentPadding: EdgeInsets.all(
            PagesDimensions.appBarTextFieldContentPadding,
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
