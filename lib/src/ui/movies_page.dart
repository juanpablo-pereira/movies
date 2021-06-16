import 'package:flutter/material.dart';

import '../widgets/movies_grid_builder.dart';
import '../model/movies_model.dart';
import '../bloc/movies_bloc.dart';
import '../utils/constants.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    Key key,
    this.title,
    this.bloc,
  }) : super(key: key);

  final String title;
  final MoviesBloc bloc;

  @override
  Widget build(BuildContext context) {
    this.bloc.fetchMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        shadowColor: Colors.blueGrey.shade100,
        elevation: Constants.appBarElevation,
      ),
      body: StreamBuilder<MoviesModel>(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MoviesGridBuilder(
              snapshot.data.results,
            );
          } else if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
