import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';

class TrendingTodayListView extends StatelessWidget {
  const TrendingTodayListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .25,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2 / 3,
            child: SizedBox(
              child: Image.asset(
                AssetsImagePath.rectTest1,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
