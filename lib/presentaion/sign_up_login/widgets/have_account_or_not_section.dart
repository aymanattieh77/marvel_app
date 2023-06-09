import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/res/strings.dart';
import 'package:marvel_app/app/res/styles.dart';
import 'package:marvel_app/shared/cubits/authentication_cubit/authentication_cubit.dart';

import '../../../app/res/colors.dart';

class HaveAccountOrNotSection extends StatelessWidget {
  const HaveAccountOrNotSection({super.key, required this.isLogin});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogin
                  ? AppStrings.dontHaveAccount
                  : AppStrings.alreadyHaveAccount,
              style: AppStyles.textstyle14.copyWith(
                  color: AppColor.white50, fontWeight: FontWeight.w700),
            ),
            InkWell(
              onTap: () {
                BlocProvider.of<AuthenticationCubit>(context)
                    .changeLoginRegister();
              },
              child: Text(
                isLogin ? AppStrings.signup : AppStrings.login,
                style: AppStyles.textstyle14
                    .copyWith(color: AppColor.red, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        )
      ],
    );
  }
}
