// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_animated_toggle.dart';
import 'package:marvel_app/presentaion/main/categories/widgets/filtering_movies_series.dart';

import '../widgets/categories_movie_series_girdview.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Column(
      children: [
        CustomAnimatedToggle(
          values: const [AppStrings.movies, AppStrings.series],
          onPress: (value) {
            print(value);
          },
        ),
        const SizedBox(height: AppSizes.s20),
        FilteringMoviesSeries(onPress: (index) {
          print(index);
        }),
        const SizedBox(height: AppSizes.s12),
        const CategoriesMovieSeriesGridview(),
      ],
    );
  }
}
