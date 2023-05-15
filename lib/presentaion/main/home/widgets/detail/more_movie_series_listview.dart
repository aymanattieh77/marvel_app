import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/more_movie_series_card.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import '../../../../../app/utils/app_router.dart';

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
                  Navigator.of(context).pushReplacementNamed(
                      AppRouter.moviePage,
                      arguments: DetailPageArguments(
                          homeCubit: context.read<HomeCubit>(),
                          model: moreMovies[index]));
                },
                child: MoreMovieSeriesCard(
                  imageUrl: moreMovies[index].coverUrl,
                  title: moreMovies[index].title,
                  releaseYear: Jiffy.parse(moreMovies[index].releaseDate)
                      .year
                      .toString(),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: AppMargin.m5),
                child: const Divider(),
              );
            },
          );
        } else {
          return Container(
            height: 20,
            color: Colors.yellowAccent,
          );
        }
      },
    );
  }
}
