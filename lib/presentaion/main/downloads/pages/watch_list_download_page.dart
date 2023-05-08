import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/downloads/widgets/movie_series_download_listview.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';

class WatchListDownloadPage extends StatelessWidget {
  const WatchListDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        const SizedBox(height: AppSizes.s24),
        Container(
          color: Colors.red,
          height: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Row(
              children: const [
                Text(AppStrings.downloads, style: AppStyles.textstyle18),
                Spacer(),
                Text(AppStrings.watchlist, style: AppStyles.textstyle18),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.s16),
        const MovieSeriesDownloadListview(),
        //todo const CategoriesMovieSeriesGridview(),
      ],
    );
  }
}
