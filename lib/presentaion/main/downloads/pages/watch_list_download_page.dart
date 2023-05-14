import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:marvel_app/app/di/service_locator.dart';

import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/values.dart';

import 'package:marvel_app/data/local/local_data/movie_series_local_storage/marvel_local_storage.dart';

import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_animated_toggle.dart';
import 'package:marvel_app/presentaion/main/downloads/widgets/movie_series_download_listview.dart';
import 'package:marvel_app/presentaion/main/home/widgets/home/custom_home_appbar.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import '../../categories/widgets/categories_movie_series_girdview.dart';

class WatchListDownloadPage extends StatelessWidget {
  const WatchListDownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomHomeAppBar(),
        const SizedBox(height: AppSizes.s24),
        CustomAnimatedToggle(
            values: const [AppStrings.download, AppStrings.watchlist],
            onPress: (index) {
              BlocProvider.of<HomeCubit>(context).downloadWatchlistTab(index);
            }),
        const SizedBox(height: AppSizes.s16),
        if (BlocProvider.of<HomeCubit>(context).downloadwatchlistTab == 0)
          const MovieSeriesDownloadListview(),
        if (BlocProvider.of<HomeCubit>(context).downloadwatchlistTab == 1)
          ValueListenableBuilder<Box<MovieSeriesModel>>(
            valueListenable: getIt<MarvelLocalStorage>().getMovieSeriesBox(),
            builder: (context, value, child) {
              return CategoriesMovieSeriesGridview(
                  items: value.values.toList());
            },
          ),
      ],
    );
  }
}
