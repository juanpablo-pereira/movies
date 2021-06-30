import 'package:flutter/material.dart';

class MovieHero extends StatelessWidget {
  const MovieHero({
    Key? key,
    required this.imageUrl,
    required this.imageFit,
    required this.heroTag,
    this.height,
    this.width,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit imageFit;
  final String heroTag;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Image.network(
        imageUrl,
        fit: imageFit,
        height: height,
        width: width,
      ),
    );
  }
}
