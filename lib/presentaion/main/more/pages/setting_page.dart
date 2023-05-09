import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:marvel_app/app/res/colors.dart';

import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/more/widgets/custom_appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppbar(title: AppStrings.settings),
                const SizedBox(height: AppSizes.s40),
                Text(
                  AppStrings.generalSettings,
                  style: AppStyles.textstyle14.copyWith(
                    color: AppColor.white50,
                  ),
                ),
                const SizedBox(height: AppSizes.s24),
                _switchTile(AppStrings.autoplay),
                _switchTile(AppStrings.pushNotifications),
                const Divider(color: AppColor.white50, thickness: 1.0),
                const SizedBox(height: AppSizes.s30),
                Text(
                  AppStrings.downloadPreferences,
                  style: AppStyles.textstyle14.copyWith(
                    color: AppColor.white50,
                  ),
                ),
                const SizedBox(height: AppSizes.s24),
                _switchTile(AppStrings.autodeleteUponCompletion),
                _switchTile(AppStrings.downloadWifi),
                Text(
                  AppStrings.deleteAllDownload,
                  style: AppStyles.textstyle14.copyWith(
                    color: AppColor.white30,
                  ),
                ),
                const SizedBox(height: AppSizes.s30),
                const Divider(color: AppColor.white50, thickness: 1.0),
                const SizedBox(height: AppSizes.s30),
                Text(
                  AppStrings.downloadVideoQuality,
                  style: AppStyles.textstyle14.copyWith(
                    color: AppColor.white50,
                  ),
                ),
                const SizedBox(height: AppSizes.s24),
                _check_listTile(
                    AppStrings.highDefinition, AppStrings.usesMoreData),
                _check_listTile(
                    AppStrings.standardDefinition, AppStrings.usesLessData),
                const SizedBox(height: AppSizes.s30),
                const Divider(color: AppColor.white50, thickness: 1.0),
                const Text(AppStrings.mobileStorage,
                    style: AppStyles.textstyle16),
                const SizedBox(height: AppSizes.s10),
                //todo line chart
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _check_listTile(String label, String sublabel) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppStyles.textstyle16),
            SizedBox(
              height: 2,
            ),
            Text(sublabel,
                style: AppStyles.textstyle12.copyWith(color: AppColor.white30)),
          ],
        ),
        const Spacer(),
        Checkbox(
          value: true,
          onChanged: (s) {},
          activeColor: AppColor.red,
          checkColor: AppColor.black,
          side: BorderSide(color: AppColor.red),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ],
    );
  }

  Widget _switchTile(String label) {
    return Row(
      children: [
        Text(label, style: AppStyles.textstyle16),
        const Spacer(),
        Switch(
          value: true,
          onChanged: (s) {},
          inactiveThumbColor: AppColor.red,
          inactiveTrackColor: AppColor.white,
          activeColor: AppColor.white,
          activeTrackColor: AppColor.red,
        ),
      ],
    );
  }
}
