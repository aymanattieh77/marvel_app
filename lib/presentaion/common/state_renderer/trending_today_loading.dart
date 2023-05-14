import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class TrendingTodayLoading extends StatelessWidget {
  const TrendingTodayLoading({super.key});

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
          return const AspectRatio(
            aspectRatio: 2 / 3,
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.rectangle,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
