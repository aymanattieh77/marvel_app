import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/utils/app_router.dart';
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
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetsIconPath.marvelLogo),
              const SizedBox(height: 50),
              const SizedBox(height: 50),
              Text(
                title,
                style: AppStyles.textStyle20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: isEndPage ? 50 : 0,
                child: CustomElevatedButton(
                  color: AppColor.red,
                  press: () {
                    // navigate to sign up page
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.signUp);
                  },
                  title: AppStrings.signup,
                ),
              ),
              const SizedBox(height: 30),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: isEndPage ? 50 : 0,
                child: CustomElevatedButton(
                  color: AppColor.black,
                  press: () {
                    // navigate to login page
                    Navigator.of(context).pushReplacementNamed(AppRouter.login);
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
