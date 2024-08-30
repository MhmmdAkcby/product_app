import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/auth/cubit/user_cubit.dart';
import 'package:product_app/auth/cubit/user_cubit_sate.dart';
import 'package:product_app/auth/model/user_model.dart';
import 'package:product_app/auth/service/auth_service.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/view/user_detail/user_view.dart';

abstract class UserState<T extends UserView> extends State<T> {
  late NavigationService navigationService;
  final GetIt _getIt = GetIt.instance;
  final String routePath = '/login';
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    navigationService = _getIt<NavigationService>();
    context.read<UserCubit>().fetchUserItem();
  }

  List<Users> userFilter(AsyncSnapshot<String?> snapshot, UserCubitSate state) {
    final username = snapshot.data?.toLowerCase().trim();
    final filteredProducts = state.item!.where((users) {
      final userUsername = users.username.toLowerCase().trim();
      return userUsername == username;
    }).toList();
    return filteredProducts;
  }

  Future<void> logoutMethod(bool isLoading) async {
    const int milliseconds = 100;

    if (!isLoading) {
      final cubit = context.read<LoginCubit>();
      await cubit.logout();
      await Future.delayed(const Duration(milliseconds: milliseconds));
      if (!cubit.state.isLoading) {
        setState(() {});
        navigationService.pushNamedAndRemoveUntil(routePath);
      }
    }
  }
}
