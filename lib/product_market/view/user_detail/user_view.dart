import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late NavigationService navigationService;
  final GetIt _getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    navigationService = _getIt<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _myButton(context, cubit),
        ],
      ),
    );
  }

  Widget _myButton(BuildContext context, LoginCubit cubit) {
    return MyButton(
      data: 'Logout',
      textColor: ProjectColor.whiteColor(),
      fontSize: _WidgetSize().buttonFontSize,
      width: _WidgetSize().myButtonWidth,
      height: _WidgetSize().myButtonHeight,
      color: ProjectColor.flushOrange(),
      borderRadius: _WidgetSize().borderRadius,
      onTap: () async {
        await cubit.logout();
        navigationService.pushNamedAndRemoveUntil('/login');
      },
    );
  }
}

class _WidgetSize {
  final double myButtonHeight = 0.07;
  final double myButtonWidth = 0.3;
  final double myButtonFontSize = 17;
  final double borderRadius = 10;
  final double buttonFontSize = 18;
}
