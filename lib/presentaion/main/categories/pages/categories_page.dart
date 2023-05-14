// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/app/res/strings.dart';

import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_animated_toggle.dart';
import 'package:marvel_app/presentaion/main/categories/widgets/filtering_movies_series.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

import '../widgets/categories_movie_series_girdview.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAnimatedToggle(
          values: const [AppStrings.movies, AppStrings.series],
          onPress: (index) {
            BlocProvider.of<HomeCubit>(context).changeTabIndex(index);
          },
        ),
        const SizedBox(height: AppSizes.s12),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is MovieSeriesLoading) {
              return const CircularProgressIndicator();
            } else if (state is MovieSeriesFailure) {
              return Container(height: 20, color: Colors.red);
            } else if (state is MovieSeriesLoaded) {
              final items =
                  BlocProvider.of<HomeCubit>(context).getMovieOrSeries();

              return CategoriesMovieSeriesGridview(items: items);
            } else {
              return Container(
                height: 20,
                color: Colors.yellowAccent,
              );
            }
          },
        ),
      ],
    );
  }
}
