import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

import '../widgets/categories_movie_series_girdview.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 40,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Row(
              children: const [
                Text(AppStrings.movies, style: AppStyles.textstyle18),
                Spacer(),
                Text(AppStrings.series, style: AppStyles.textstyle18),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.s20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Chip(label: Text('Newest')),
            Chip(label: Text('Oldest')),
            Chip(label: Text('Top')),
            Chip(label: Text('Order')),
          ],
        ),
        const SizedBox(height: AppSizes.s12),
        const CategoriesMovieSeriesGridview(),
      ],
    );
  }
}
