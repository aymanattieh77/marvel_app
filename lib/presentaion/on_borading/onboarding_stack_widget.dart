import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/app/utils/constants.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';

class OnBoradingStackWidget extends StatelessWidget {
  const OnBoradingStackWidget({
    super.key,
    required this.image,
    required this.title,
    required this.isEndPage,
  });

  final String image;
  final String title;
  final bool isEndPage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          child: Text(
            title,
            style: AppStyles.textStyle20,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSizes.s250),
              AnimatedContainer(
                duration:
                    const Duration(milliseconds: AppConstants.duration200m),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                height: isEndPage ? AppSizes.s50 : AppSizes.s0,
                child: CustomElevatedButton(
                  color: AppColor.red,
                  press: () {
                    // navigate to sign up page
                    Navigator.of(context).pushReplacementNamed(
                        AppRouter.loginSignUp,
                        arguments: false);
                  },
                  title: AppStrings.signup,
                ),
              ),
              const SizedBox(height: AppSizes.s30),
              AnimatedContainer(
                duration:
                    const Duration(milliseconds: AppConstants.duration200m),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                height: isEndPage ? AppSizes.s50 : AppSizes.s0,
                child: CustomElevatedButton(
                  color: AppColor.black,
                  press: () {
                    // navigate to login page
                    Navigator.of(context).pushReplacementNamed(
                        AppRouter.loginSignUp,
                        arguments: true);
                  },
                  title: AppStrings.login,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
