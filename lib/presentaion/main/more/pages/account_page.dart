import 'package:flutter/material.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/app/res/values.dart';
import 'package:marvel_app/presentaion/main/more/widgets/custom_appbar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
          child: Column(
            children: [
              const CustomAppbar(title: AppStrings.account),
              const SizedBox(height: AppSizes.s60),
              const Text(AppStrings.whoWatching, style: AppStyles.textstyle24),
              const SizedBox(height: AppSizes.s20),
              _cricleAvater(),
              const SizedBox(height: AppSizes.s20),
              Row(
                children: [_cricleAvater(), const Spacer(), _cricleAvater()],
              ),
              const SizedBox(height: AppSizes.s20),
              _cricleAvater()
            ],
          ),
        ),
      ),
    );
  }

  _cricleAvater() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red,
        ),
        SizedBox(
          height: 4,
        ),
        Text('UIUXDIVYANSHU', style: AppStyles.textstyle18)
      ],
    );
  }
}
