import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/trending_today_listview.dart';

import '../widgets/home/lastet_movies_series_listview.dart';

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
              Padding(
                padding: EdgeInsets.only(left: 12),
                child:
                    Text(AppStrings.lastetMovies, style: AppStyles.textstyle24),
              ),
              SizedBox(height: 10),
              // lastet movies section
              LastetMoviesSeriesListView(image: AssetsImagePath.cardTest),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child:
                    Text(AppStrings.lastetSeries, style: AppStyles.textstyle24),
              ),
              SizedBox(height: 10),
              // lastet series section
              LastetMoviesSeriesListView(image: AssetsImagePath.cardTest2),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(AppStrings.trendingToday,
                    style: AppStyles.textstyle24),
              ),
              SizedBox(height: 14),
              TrendingTodayListView(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(AppStrings.oldMovies, style: AppStyles.textstyle24),
              ),
              SizedBox(height: 14),
              TrendingTodayListView(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(AppStrings.oldSeries, style: AppStyles.textstyle24),
              ),
              SizedBox(height: 14),
              TrendingTodayListView(),
              SizedBox(height: 66),
            ],
          ),
        ),
      ],
    );
  }
}
