import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/values.dart';

import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';

class WatchListDownloadScreen extends StatelessWidget {
  const WatchListDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHomeAppBar(),
            SizedBox(height: AppSizes.s24),
            // CustomAnimatedToggle(
            //     values: const [AppStrings.download, AppStrings.watchlist],
            //     onPress: (index) {
            //       BlocProvider.of<HomeCubit>(context)
            //           .downloadWatchlistTab(index);
            //     }),
            // const SizedBox(height: AppSizes.s16),
            // if (BlocProvider.of<HomeCubit>(context).downloadwatchlistTab == 0)
            //   const MovieSeriesDownloadListview(),
            // if (BlocProvider.of<HomeCubit>(context).downloadwatchlistTab == 1)
            //   ValueListenableBuilder<Box<MovieSeriesModel>>(
            //     valueListenable:
            //         getIt<MarvelLocalStorage>().getMovieSeriesBox(),
            //     builder: (context, value, child) {
            //       return CategoriesMovieSeriesGridview(
            //           items: value.values.toList());
            //     },
            //   ),
          ],
        ),
      ),
    );
  }
}
