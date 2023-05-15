import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';

class MovieSeriesDownloadCard extends StatelessWidget {
  const MovieSeriesDownloadCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey10,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(
              AssetsImagePath.downTest,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(width: AppSizes.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.s16),
                const Text('Spider-Man: Homecoming',
                    style: AppStyles.textstyle16, maxLines: 1),
                const SizedBox(height: AppSizes.s10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Slider(
                          value: 0.3,
                          onChanged: (s) {},
                          inactiveColor: AppColor.white30,
                          activeColor: AppColor.red,
                        ),
                      ),
                      Expanded(
                          child: Text('1.2GB',
                              style: AppStyles.textstyle10
                                  .copyWith(color: AppColor.white50))),
                    ],
                  ),
                ),
                Text(
                  '0% Watched',
                  style:
                      AppStyles.textstyle10.copyWith(color: AppColor.white50),
                ),
                const Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: AppPadding.p12, bottom: AppPadding.p12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SvgPicture.asset(AssetsIconPath.delete)],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
