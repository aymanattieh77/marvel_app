import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';

class TrendingTodayListView extends StatelessWidget {
  const TrendingTodayListView({
    super.key,
    required this.items,
  });
  final List<MovieSeriesModel> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length - 1,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2 / 3,
            child: SizedBox(
              child: CachedNetworkImage(
                imageUrl: items[index].coverUrl,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
