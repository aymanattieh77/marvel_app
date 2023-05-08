import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';
import 'package:marvel_app/presentaion/on_borading/on_Boarding_dummy.dart';
import 'package:marvel_app/presentaion/on_borading/onboarding_stack_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  final controller = PageController();
  bool isEndPage = false;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation =
        Tween<Offset>(begin: const Offset(0, 300), end: const Offset(0, 220))
            .animate(_animationController);
    _startAnimation();
  }

  _startAnimation() {
    _animationController.forward();
  }

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
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.52,
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
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, _) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 600),
                        top: _animation.value.dy,
                        child: SvgPicture.asset(AssetsIconPath.marvelLogo),
                      );
                    }),
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
