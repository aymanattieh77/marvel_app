import 'package:flutter/material.dart';
import 'package:marvel_app/presentaion/sign_up_login/widgets/sign_up_or_login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignUpOrLoginBody(isLogin: true)),
    );
  }
}
