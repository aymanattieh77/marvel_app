part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class ShowPassword extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  const AuthenticationFailure(this.message);
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class LoginState extends AuthenticationState {}

class RegisterState extends AuthenticationState {}
