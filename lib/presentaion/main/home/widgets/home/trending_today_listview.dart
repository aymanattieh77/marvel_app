import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import '../../../../../app/utils/app_router.dart';

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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _goToDetailPage(context, index);
            },
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: SizedBox(
                child: Hero(
                  tag: "${items[index].coverUrl}${items[index].id}",
                  child: CachedNetworkImage(
                    imageUrl: items[index].coverUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }

  void _goToDetailPage(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      AppRouter.moviePage,
      arguments: DetailPageArguments(
          homeCubit: context.read<HomeCubit>(),
          model: items[index],
          heroTag: "${items[index].coverUrl}${items[index].id}"),
    );
  }
}
