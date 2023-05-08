import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

import '../../../../../app/res/colors.dart';

class CastMovieSeriesCard extends StatelessWidget {
  const CastMovieSeriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(
              AssetsImagePath.castTest,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: AppSizes.s20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Paul Bettany',
                    style: AppStyles.textStyle20, maxLines: 1),
                const SizedBox(height: AppSizes.s10),
                Text('Director',
                    style: AppStyles.textstyle14
                        .copyWith(color: AppColor.white30)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
