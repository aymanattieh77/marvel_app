import 'package:flutter/material.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/sign_up_or_login_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignUpOrLoginBody(isLogin: false),
      ),
    );
  }
}
