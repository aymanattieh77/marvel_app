import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/lastet_movie_series_image.dart';
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
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: CarouselSlider(
        items: getMoviesSeriesCardList(context),
        options: CarouselOptions(
          initialPage: 0,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
      ),
    );
  }

  List<Widget> getMoviesSeriesCardList(BuildContext context) {
    return List.generate(
      items.length,
      (index) => LastetMovieSeriesImage(
        imageUrl: items[index].coverUrl,
        heroTag: "${items[index].title}${items[index].coverUrl}",
        onTap: () {
          _goToDetailPage(context, index);
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
        heroTag: "${items[index].title}${items[index].coverUrl}",
      ),
    );
  }
}
