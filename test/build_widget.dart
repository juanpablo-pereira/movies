import 'package:flutter/material.dart';

Widget buildWidget([Widget? widget]) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Movies App',
    home: widget,
  );
}
