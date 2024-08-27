import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LoginCubitState extends Equatable {
  final TextEditingController? username;
  final TextEditingController? password;
  final String? message;
  final bool isAuthenticated;

  const LoginCubitState({
    this.username,
    this.password,
    this.message,
    this.isAuthenticated = false,
  });

  @override
  List<Object?> get props => [username, password, message, isAuthenticated];

  LoginCubitState copyWith({
    TextEditingController? username,
    TextEditingController? password,
    String? message,
    bool? isAuthenticated,
  }) {
    return LoginCubitState(
      username: username ?? this.username,
      password: password ?? this.password,
      message: message,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
