import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:marvel_app/presentaion/on_borading/on_Boarding_dummy.dart';
import 'package:marvel_app/presentaion/on_borading/onboarding_stack_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isEndPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                _onboardingPageView(),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 70),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: obBorading.length,
                      effect: const WormEffect(
                          dotColor: AppColor.white,
                          activeDotColor: AppColor.red,
                          dotHeight: 10,
                          dotWidth: 10),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                  height: isEndPage ? 0 : 50,
                  margin: const EdgeInsets.only(bottom: 70),
                  child: CustomElevatedButton(
                    color: AppColor.red,
                    press: _goNextPage,
                    title: AppStrings.continue_,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _goNextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  PageView _onboardingPageView() {
    return PageView.builder(
      controller: controller,
      itemCount: obBorading.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return OnBoradingStackWidget(
          image: obBorading[index]['image'] as String,
          title: obBorading[index]['title'] as String,
          isEndPage: isEndPage,
        );
      },
    );
  }

  void _onPageChanged(int value) {
    if (value == obBorading.length - 1) {
      setState(() {
        isEndPage = true;
      });
    } else {
      setState(() {
        isEndPage = false;
      });
    }
  }
}
