// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/colors.dart';
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
        const SizedBox(
          width: double.infinity,
        ),
         
        const SizedBox(height: AppSizes.s20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [],
        ),
        const SizedBox(height: AppSizes.s12),
        const CategoriesMovieSeriesGridview(),
      ],
    );
  }
}
