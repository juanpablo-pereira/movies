import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
    );
  }
}
