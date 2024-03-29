import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/res.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/character_section.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/comics_section.dart';

import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/lastet_movies_section.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/lastet_series_section.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/movies_series_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomHomeAppBar(),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              SizedBox(height: AppSizes.s30),
              LastetMoviesSection(),
              LastetSeriesSection(),
              MoviesSeriesSection(title: AppStrings.trendingToday),
              MoviesSeriesSection(title: AppStrings.oldSeries),
              ComicsSection(),
              CharacterSection(),
              SizedBox(height: AppSizes.s60),
            ],
          ),
        ),
      ],
    );
  }
}
