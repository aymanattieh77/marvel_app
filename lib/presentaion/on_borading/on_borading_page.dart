import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool end = false;
  final obBorading = [
    {
      'title': AppStrings.onBoardingTitle1,
      'image': AssetsImagePath.onBorading1
    },
    {
      'title': AppStrings.onBoardingTitle2,
      'image': AssetsImagePath.onBorading2
    },
    {
      'title': AppStrings.onBoardingTitle3,
      'image': AssetsImagePath.onBorading3
    },
    {
      'title': AppStrings.onBoardingTitle4,
      'image': AssetsImagePath.onBorading4
    },
    {
      'title': AppStrings.onBoardingTitle5,
      'image': AssetsImagePath.onBorading5
    },
    {'title': '', 'image': AssetsImagePath.onBorading6},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                PageView.builder(
                  itemCount: obBorading.length,
                  controller: controller,
                  onPageChanged: (value) {
                    if (value == obBorading.length - 1) {
                      setState(() {
                        end = true;
                      });
                    } else {
                      setState(() {
                        end = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return StackTitleImage(
                        image: obBorading[index]['image'] as String,
                        title: obBorading[index]['title'] as String);
                  },
                ),
                Center(
                  child: SvgPicture.asset(AssetsIconPath.marvelLogo),
                ),
                Positioned(
                  top: 379,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 6,
                    effect: const WormEffect(
                      dotColor: AppColor.white,
                      activeDotColor: AppColor.red,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!end)
            Container(
              margin: const EdgeInsets.only(bottom: 80, top: 30),
              child: CustomElevatedButton(
                  color: AppColor.red,
                  press: () {},
                  title: AppStrings.continue_),
            ),
          if (end)
            Container(
              child: CustomElevatedButton(
                  color: AppColor.red, press: () {}, title: AppStrings.signup),
            ),
          if (end) const SizedBox(height: 20),
          if (end)
            Container(
              child: CustomElevatedButton(
                color: AppColor.black,
                press: () {},
                title: AppStrings.login,
              ),
            ),
        ],
      ),
    );
  }
}

class StackTitleImage extends StatelessWidget {
  const StackTitleImage({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(AppPadding.p5),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle20,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
