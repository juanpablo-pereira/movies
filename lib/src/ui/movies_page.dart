import 'package:flutter/material.dart';

import '../widgets/movies_grid_builder.dart';
import '../model/movie.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/movie_seach_bar.dart';
import '../utils/pages_dimensions.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    Key? key,
    required this.title,
    required this.bloc,
  }) : super(key: key);

  final String title;
  final MoviesBloc bloc;

  @override
  Widget build(BuildContext context) {
    this.bloc.fetchTrendingMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            PagesDimensions.appBarBottomHeight,
          ),
          child: MovieSearchBar(
            bloc: this.bloc,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade900,
        shadowColor: Colors.blueGrey.shade100,
        elevation: PagesDimensions.appBarElevation,
      ),
      body: StreamBuilder<Movie>(
        stream: bloc.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? MoviesGridBuilder(
                  snapshot.data!.results,
                )
              : snapshot.hasError
                  ? Text(
                      '${snapshot.error}',
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}
