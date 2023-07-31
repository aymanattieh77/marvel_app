import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LastetMovieSeriesImage extends StatelessWidget {
  const LastetMovieSeriesImage(
      {super.key, required this.imageUrl, this.onTap, required this.heroTag});

  final String imageUrl;
  final String heroTag;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 4 / 2.5,
          child: Hero(
            tag: heroTag,
            child: CachedNetworkImage(
                imageUrl: imageUrl,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
