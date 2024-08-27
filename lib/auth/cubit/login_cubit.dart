import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/auth/cubit/login_cubit_state.dart';
import 'package:product_app/auth/product/utils/string_extension.dart';
import 'package:product_app/auth/service/auth_service.dart';
import 'package:product_app/auth/service/login_service.dart';
import 'package:product_app/auth/model/user.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginService _loginService;
  final AuthService _authService;

  LoginCubit(this._loginService, this._authService)
      : super(LoginCubitState(username: TextEditingController(), password: TextEditingController()));

  Future<void> submit() async {
    final username = state.username?.text.trim();
    final password = state.password?.text.trim();

    if (username == null || username.isEmpty || password == null || password.isEmpty) {
      emit(state.copyWith(message: WaringString.waringMessageOne.toStr()));
      return;
    }

    emit(state.copyWith(isLoading: true));
    final user = User(username: username, password: password);

    try {
      final isAuthenticated = await _loginService.authenticateUser(user);
      if (isAuthenticated) {
        await _authService.saveLoginStatus(true);
        emit(state.copyWith(isAuthenticated: true, isLoading: false));
      } else {
        emit(state.copyWith(message: WaringString.waringMessageTwo.toStr(), isLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), isLoading: false));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    try {
      await _authService.logout();
      emit(state.copyWith(isAuthenticated: false, isLoading: false));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), isLoading: false));
    }
  }
}
