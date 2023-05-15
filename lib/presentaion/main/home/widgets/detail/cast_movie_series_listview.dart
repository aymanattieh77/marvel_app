import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/home/widgets/detail/cast_movie_series_card.dart';

class CastMovieSeriesListview extends StatelessWidget {
  const CastMovieSeriesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: AppPadding.p16),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const CastMovieSeriesCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSizes.s10);
      },
    );
  }
}
