import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/lastet_movies_series_section.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/movies_series_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomHomeAppBar(), // home appbar
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: 30),
              LastetMoviesSeriesSection(title: AppStrings.lastetMovies),
              LastetMoviesSeriesSection(title: AppStrings.lastetSeries),
              MoviesSeriesSection(title: AppStrings.trendingToday),
              MoviesSeriesSection(title: AppStrings.oldMovies),
              MoviesSeriesSection(title: AppStrings.oldSeries),
              SizedBox(height: 66),
            ],
          ),
        ),
      ],
    );
  }
}