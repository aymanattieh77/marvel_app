import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/trending_today_listview.dart';

class MoviesSeriesSection extends StatelessWidget {
  const MoviesSeriesSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.only(left: AppPadding.p12),
          child: Text(AppStrings.trendingToday, style: AppStyles.textstyle24),
        ),
        SizedBox(height: AppSizes.s10),
        TrendingTodayListView(),
        SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
