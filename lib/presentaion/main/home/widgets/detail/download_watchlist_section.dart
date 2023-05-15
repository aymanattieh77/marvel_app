import 'package:flutter/material.dart';
import 'package:marvel_app/app/di/service_locator.dart';

import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/data/local/local_data/movie_series_local_storage/marvel_local_storage.dart';
import 'package:marvel_app/domain/models/move_series/movie_series_model.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';

class DownloadWatchListSection extends StatelessWidget {
  const DownloadWatchListSection({
    super.key,
    required this.model,
  });
  final MovieSeriesModel model;
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
              onTap: () async {
                getIt<MarvelLocalStorage>().addToWatchList(model);
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
