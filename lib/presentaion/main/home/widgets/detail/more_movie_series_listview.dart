import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/more_movie_series_card.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import 'package:marvel_app/app/utils/app_router.dart';

class MoreMovieSeriesListview extends StatelessWidget {
  const MoreMovieSeriesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is MovieSeriesLoading) {
          return const CircularProgressIndicator();
        }
        if (state is MovieSeriesFailure) {
          return Container(height: 20, color: Colors.red);
        }
        if (state is MovieSeriesLoaded) {
          final moreMovies = BlocProvider.of<HomeCubit>(context).movies;
          moreMovies.shuffle();

          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: AppPadding.p16),
            shrinkWrap: true,
            itemCount: moreMovies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _goToDetailPage(context, moreMovies, index);
                },
                child: MoreMovieSeriesCard(
                  imageUrl: moreMovies[index].coverUrl,
                  title: moreMovies[index].title,
                  releaseDate: moreMovies[index].releaseDate,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return _divider();
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _goToDetailPage(
      BuildContext context, List<MovieSeriesModel> movies, int index) {
    Navigator.of(context).pushReplacementNamed(
      AppRouter.moviePage,
      arguments: DetailPageArguments(
        homeCubit: context.read<HomeCubit>(),
        model: movies[index],
        heroTag: "${movies[index].coverUrl}${movies[index].releaseDate}",
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m5),
      child: const Divider(),
    );
  }
}
