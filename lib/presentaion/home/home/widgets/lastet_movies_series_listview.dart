import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/utils/app_router.dart';

class LastetMoviesSeriesListView extends StatelessWidget {
  const LastetMoviesSeriesListView({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRouter.moviePage);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .30,
        child: CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
          ),
          itemBuilder: (context, index, realIndex) {
            return AspectRatio(
              aspectRatio: 4 / 2.5,
              child: Image.asset(
                image,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
              ),
            );
          },
        ),
      ),
    );
  }
}
