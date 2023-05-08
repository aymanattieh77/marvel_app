import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/functions.dart';

class TrailerMovieSeriesCard extends StatelessWidget {
  const TrailerMovieSeriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 4 / 2,
            child: Image.asset(AssetsImagePath.trTest),
          ),
          GestureDetector(
            onTap: () {
              _openMovieTrailer(context);
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

_openMovieTrailer(BuildContext context) {
  try {
    openUrl('https://www.youtube.com/watch?v=ZlNFpri-Y40');
  } catch (e) {
    showToastMessage(context, e.toString());
  }
}
