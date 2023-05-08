import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';

class CategoriesMovieSeriesGridview extends StatelessWidget {
  const CategoriesMovieSeriesGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 23),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.7 / 4),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Image.asset(AssetsImagePath.cardTest, fit: BoxFit.cover);
        },
      ),
    );
  }
}
