import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/more_movie_series_card.dart';

class MoreMovieSeriesListview extends StatelessWidget {
  const MoreMovieSeriesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: AppPadding.p16),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MoreMovieSeriesCard();
      },
      separatorBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m5),
          child: const Divider(),
        );
      },
    );
  }
}
