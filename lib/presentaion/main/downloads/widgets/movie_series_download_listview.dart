import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/downloads/widgets/movie_series_download_card.dart';

class MovieSeriesDownloadListview extends StatelessWidget {
  const MovieSeriesDownloadListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        itemBuilder: (context, index) {
          return const MovieSeriesDownloadCard();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: AppSizes.s16,
        ),
      ),
    );
  }
}
