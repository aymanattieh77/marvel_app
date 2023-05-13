import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_app/app/utils/functions.dart';
import 'package:marvel_app/shared/services/auth/auth_error.dart';
import 'package:marvel_app/shared/services/auth/authentication.dart';

import '../../../app/utils/app_router.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  bool isLogin = false;

  changeLoginRegister() {
    if (isLogin) {
      isLogin = false;
      emit(RegisterState());
    } else {
      isLogin = true;
      emit(LoginState());
    }
  }

  signUpOrLogin(BuildContext context, String email, String password) async {
    (await registerOrLogin(email, password, isLogin)).fold(
      (authFailure) {
        emit(AuthenticationFailure(authFailure.toMessage()));
        showToastMessage(context, authFailure.toMessage());
      },
      (userCredential) {
        emit(AuthenticationSuccess());
        navigatingToHome(context);
      },
    );
  }

  navigatingToHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRouter.home);
  }
}
