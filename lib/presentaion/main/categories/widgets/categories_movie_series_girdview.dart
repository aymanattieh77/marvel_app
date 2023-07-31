import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/utils/app_router.dart';

import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

class CategoriesMovieSeriesGridview extends StatelessWidget {
  const CategoriesMovieSeriesGridview({
    super.key,
    required this.items,
  });
  final List<MovieSeriesModel> items;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 23),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.7 / 4),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _goToDetailPage(context, index);
            },
            child: Hero(
              tag: "_hero_image${items[index].coverUrl}",
              child: CachedNetworkImage(
                  imageUrl: items[index].coverUrl, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  _goToDetailPage(BuildContext context, int index) {
    Navigator.of(context).pushNamed(
      AppRouter.moviePage,
      arguments: DetailPageArguments(
        homeCubit: context.read<HomeCubit>(),
        model: items[index],
        heroTag: "_hero_image${items[index].coverUrl}",
      ),
    );
  }
}
