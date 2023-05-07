import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
          ],
        ),
      ),
    );
  }
}
