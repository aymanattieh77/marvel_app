import 'package:flutter/material.dart';
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
          IconButton(
            onPressed: () {
              _openMovieTrailer(context);
            },
            icon: const Icon(
              Icons.play_circle,
              color: AppColor.white,
              size: AppSizes.s45,
            ),
          )
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
