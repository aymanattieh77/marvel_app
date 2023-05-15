import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_app/app/res/assets.dart';
import 'package:marvel_app/app/res/colors.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardDetailsSection extends StatelessWidget {
  const CardDetailsSection({
    super.key,
    required this.imageUrl,
    required this.title,
  });
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .65,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(imageUrl),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: List.generate(
                            10,
                            (index) =>
                                AppColor.black.withOpacity((index + 1) / 10))
                        .toList(),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              )),
          Positioned(
            top: 56,
            left: 60,
            right: 60,
            child: Text(
              title,
              style: AppStyles.textStyle20,
              textAlign: TextAlign.center,
              maxLines: 2,
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
    );
  }
}
