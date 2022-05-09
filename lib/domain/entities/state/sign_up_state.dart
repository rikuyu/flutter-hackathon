import 'package:flutter/cupertino.dart';

@immutable
class SignUpState {
  const SignUpState(
      {this.email = "",
        this.password = "",
        this.confirmedPassword = "",
        this.isLoading = false});

  final String email;
  final String password;
  final String confirmedPassword;
  final bool isLoading;

  SignUpState copy(
      {String? email,
        String? password,
        String? confirmedPassword,
        bool? isLoading}) =>
      SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        isLoading: isLoading ?? this.isLoading,
      );
}
