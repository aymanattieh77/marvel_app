import 'package:flutter/material.dart';

import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

import '../../../../../app/res/assets.dart';
import 'lastet_movies_series_listview.dart';

class LastetMoviesSeriesSection extends StatelessWidget {
  const LastetMoviesSeriesSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppPadding.p12),
          child: Text(title, style: AppStyles.textstyle24),
        ),
        const SizedBox(height: AppSizes.s10),
        // lastet movies section
        const LastetMoviesSeriesListView(image: AssetsImagePath.cardTest),
        const SizedBox(height: AppSizes.s24),
      ],
    );
  }
}
