import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

class LastetMoviesSeriesListView extends StatelessWidget {
  const LastetMoviesSeriesListView({
    super.key,
    required this.items,
  });

  final List<MovieSeriesModel> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: CarouselSlider.builder(
        itemCount: items.length - 1,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.moviePage,
                  arguments: DetailPageArguments(
                      homeCubit: context.read<HomeCubit>(),
                      model: items[index]));
            },
            child: AspectRatio(
              aspectRatio: 4 / 2.5,
              child: CachedNetworkImage(
                  imageUrl: items[index].coverUrl,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fitWidth),
            ),
          );
        },
      ),
    );
  }
}
