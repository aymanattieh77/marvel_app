import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MoreMovieSeriesCard extends StatelessWidget {
  const MoreMovieSeriesCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.releaseDate,
  });
  final String imageUrl;
  final String title;
  final String releaseDate;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Hero(
              tag: "$imageUrl$releaseDate",
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          const SizedBox(width: AppSizes.s20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.textStyle20, maxLines: 2),
                const SizedBox(height: AppSizes.s10),
                Text(
                  Jiffy.parse(releaseDate).year.toString(),
                  style:
                      AppStyles.textstyle14.copyWith(color: AppColor.white30),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
