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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p12),
          child: Text(title, style: AppStyles.textstyle24),
        ),
        const SizedBox(height: AppSizes.s10),
        const TrendingTodayListView(),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
