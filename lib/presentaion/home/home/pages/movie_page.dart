import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_elevated_button.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        'Super Hero partners Scott Lang and Hope Van Dyne return to continue their adventures as Ant-Man and The Wasp. Together, with Hope’s parents Hank Pym and Janet Van Dyne, the family finds themselves exploring the Quantum Realm, interacting with strange new creatures, and embarking on an adventure that will push them beyond the limits of what they thought was possible.';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetsImagePath.cardTest),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: List.generate(
                                  10,
                                  (index) => AppColor.black
                                      .withOpacity((index + 1) / 10)).toList(),
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        )),
                    const Positioned(
                      top: 56,
                      child: Text(
                        'Ant-Man and The Wasp\nQuantumania',
                        style: AppStyles.textStyle20,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SvgPicture.asset(AssetsIconPath.arrowCircleRight),
                    Positioned(
                      top: 16,
                      left: 12,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(
                          child: SvgPicture.asset(AssetsIconPath.back),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
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
                      child: Text(
                        AppStrings.addToWatchlist,
                        style: AppStyles.textstyle15.copyWith(
                            color: AppColor.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 150,
                child: Text(
                  data,
                  style: AppStyles.textstyle14.copyWith(
                      color: AppColor.white, fontWeight: FontWeight.w400),
                  softWrap: true,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
