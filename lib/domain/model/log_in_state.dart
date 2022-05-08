import 'package:flutter/cupertino.dart';

@immutable
class LogInState {
  const LogInState(
      {this.email = "", this.password = "", this.isLoading = false});

  final String email;
  final String password;
  final bool isLoading;

  LogInState copy({String? email, String? password, bool? isLoading}) =>
      LogInState(
        email: email ?? this.email,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
      );
}
