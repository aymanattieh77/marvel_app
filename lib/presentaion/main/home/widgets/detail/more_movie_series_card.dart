import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class MoreMovieSeriesCard extends StatelessWidget {
  const MoreMovieSeriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(
              AssetsImagePath.moreTest,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: AppSizes.s20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Avengers:Age of Ultron',
                    style: AppStyles.textStyle20, maxLines: 2),
                const SizedBox(height: AppSizes.s10),
                Text('2015',
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
