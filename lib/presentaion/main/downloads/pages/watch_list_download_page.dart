import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_animated_toggle.dart';
import 'package:marvel_app/presentaion/main/categories/widgets/categories_movie_series_girdview.dart';
import 'package:marvel_app/presentaion/main/downloads/widgets/movie_series_download_listview.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';

class WatchListDownloadPage extends StatefulWidget {
  const WatchListDownloadPage({super.key});

  @override
  State<WatchListDownloadPage> createState() => _WatchListDownloadPageState();
}

class _WatchListDownloadPageState extends State<WatchListDownloadPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        const SizedBox(height: AppSizes.s24),
        CustomAnimatedToggle(
            values: const [AppStrings.download, AppStrings.watchlist],
            onPress: (index) {
              setState(() {
                currentIndex = index;
              });
            }),
        const SizedBox(height: AppSizes.s16),
        if (currentIndex == 0) const MovieSeriesDownloadListview(),
        // if (currentIndex == 1) const CategoriesMovieSeriesGridview(),
      ],
    );
  }
}
