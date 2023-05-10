import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class FilteringMoviesSeries extends StatefulWidget {
  const FilteringMoviesSeries({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  final Function(int) onPress;

  @override
  State<FilteringMoviesSeries> createState() => _FilteringMoviesSeriesState();
}

class _FilteringMoviesSeriesState extends State<FilteringMoviesSeries> {
  final List<bool> _selected = [true, false, false, false];
  final List<String> labels = [
    AppStrings.newest,
    AppStrings.oldest,
    AppStrings.top,
    AppStrings.order
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s30,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: List.generate(_selected.length, (index) {
          return _chip(labels[index], index);
        }),
      ),
    );
  }

  _chip(String label, int index) {
    return GestureDetector(
      onTap: () {
        _chipAction(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p5),
          decoration: BoxDecoration(
              color: _selected[index] ? AppColor.white : AppColor.black,
              borderRadius: BorderRadius.circular(AppSizes.s20),
              border: Border.all(color: AppColor.white)),
          child: Text(
            label,
            style: AppStyles.textstyle15.copyWith(
              color: _selected[index] ? AppColor.black : AppColor.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  _chipAction(int index) {
    widget.onPress.call(index);

    setState(() {
      for (int i = 0; i < _selected.length; i++) {
        _selected[i] = i == index;
      }
    });
  }
}
