import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

class LastetMoviesSeriesListView extends StatelessWidget {
  const LastetMoviesSeriesListView({
    super.key,
    required this.items,
  });

  final List<MovieSeriesModel> items;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouter.moviePage);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .30,
        child: CarouselSlider.builder(
          itemCount: items.length - 1,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
          ),
          itemBuilder: (context, index, realIndex) {
            return AspectRatio(
              aspectRatio: 4 / 2.5,
              child: CachedNetworkImage(
                  imageUrl: items[index].coverUrl,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth),
            );
          },
        ),
      ),
    );
  }
}
