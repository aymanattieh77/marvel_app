import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class LastetMovieSeriesLoading extends StatelessWidget {
  const LastetMovieSeriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return const AspectRatio(
            aspectRatio: 4 / 2.5,
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.rectangle,
              ),
            ),
          );
        },
        options: CarouselOptions(
          initialPage: 0,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
        ),
      ),
    );
  }
}
