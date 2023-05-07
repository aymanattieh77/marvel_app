import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';

class TrendingTodaySection extends StatelessWidget {
  const TrendingTodaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 150,
            width: 100,
            child: Image.asset(
              AssetsImagePath.rectTest1,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
