import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:marvel_app/shared/cubits/home_cubit/home_cubit.dart';

class DownloadWatchListSection extends StatelessWidget {
  const DownloadWatchListSection({
    super.key,
    required this.arg,
  });

  final DetailPageArguments arg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              color: AppColor.black,
              press: () {},
              title: AppStrings.download,
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: InkWell(
              onTap: () {
                int id = arg.model.id;
                bool isMovie = arg.model.duration != 0;
                arg.homeCubit.addToWatchList(id, isMovie);
              },
              child: Text(
                AppStrings.addToWatchlist,
                style: AppStyles.textstyle15.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
