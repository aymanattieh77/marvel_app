import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/trending_today_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

class MoviesSeriesSection extends StatelessWidget {
  const MoviesSeriesSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p12),
          child: Text(title, style: AppStyles.textstyle24),
        ),
        const SizedBox(height: AppSizes.s10),
        BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is MovieSeriesLoading) {
            return const CircularProgressIndicator();
          } else if (state is MovieSeriesFailure) {
            return Container(height: 20, color: Colors.red);
          } else if (state is MovieSeriesLoaded) {
            final items = getMoviesSeries(context);
            items.shuffle();

            return TrendingTodayListView(items: items);
          } else {
            return Container(height: 20, color: Colors.yellowAccent);
          }
        }),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }

  List<MovieSeriesModel> getMoviesSeries(BuildContext context) {
    if (title == AppStrings.oldSeries) {
      return BlocProvider.of<HomeCubit>(context).series;
    } else if (title == AppStrings.oldMovies) {
      final oldMovies = BlocProvider.of<HomeCubit>(context).movies;
      oldMovies.shuffle();
      return oldMovies;
    } else {
      return BlocProvider.of<HomeCubit>(context).movies;
    }
  }
}
