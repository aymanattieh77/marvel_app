import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrailerMovieSeriesCard extends StatelessWidget {
  const TrailerMovieSeriesCard(
      {super.key, required this.imageUrl, required this.url});
  final String imageUrl;
  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: AspectRatio(
              aspectRatio: 4 / 2.5,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _openMovieTrailer(context, url);
            },
            child: SvgPicture.asset(
              AssetsIconPath.arrowCircleRight,
              colorFilter:
                  const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}

_openMovieTrailer(BuildContext context, String url) {
  try {
    openUrl(url);
  } catch (e) {
    showToastMessage(context, e.toString());
  }
}
