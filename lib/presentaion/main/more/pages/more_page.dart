import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/app/utils/app_router.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:marvel_app/presentaion/common/widgets/custom_dialog.dart';
import 'package:marvel_app/presentaion/main/more/widgets/list_tile_settings.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.red,
                ),
                Text('UIUXDIVYANSHU', style: AppStyles.textStyle20)
              ],
            ),
          ),
          const SizedBox(height: AppSizes.s26),
          ListTileSettings(
            title: AppStrings.account,
            press: () {
              Navigator.of(context).pushNamed(AppRouter.accountPage);
            },
          ),
          ListTileSettings(
            title: AppStrings.settings,
            press: () {
              Navigator.of(context).pushNamed(AppRouter.settingPage);
            },
          ),
          ListTileSettings(title: AppStrings.legal, press: () {}),
          ListTileSettings(title: AppStrings.support, press: () {}),
          ListTileSettings(title: AppStrings.privacySettings, press: () {}),
          ListTileSettings(
            title: AppStrings.downloadAndWatchList,
            press: () {
              Navigator.of(context).pushNamed(AppRouter.downloadWatchList);
            },
          ),
          ListTileSettings(title: AppStrings.parentalControl, press: () {}),
          const SizedBox(height: AppSizes.s28),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Divider(),
          ),
          const SizedBox(height: AppSizes.s28),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p20),
            child: InkWell(
              onTap: () {
                showCustomDialog(
                  context,
                  CustomDialog(
                    title: AppStrings.doYouReallySignOut,
                    press: () async {
                      await signOut(context);
                    },
                  ),
                );
              },
              child:
                  const Text(AppStrings.signOut, style: AppStyles.textStyle20),
            ),
          ),
        ],
      ),
    );
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Phoenix.rebirth(context);
  }
}
