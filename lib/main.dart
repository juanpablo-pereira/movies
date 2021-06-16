import 'package:flutter/material.dart';

import 'src/bloc/movies_bloc.dart';
import 'src/ui/movies_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _bloc = MoviesBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      home: MoviesPage(
        title: 'Watch popular movies',
        bloc: _bloc,
      ),
    );
  }
}
