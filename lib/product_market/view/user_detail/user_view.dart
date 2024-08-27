import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late NavigationService navigationService;
  final GetIt _getIt = GetIt.instance;
  final String routePath = '/login';

  @override
  void initState() {
    super.initState();
    navigationService = _getIt<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      body: _buildUI(context: context, cubit: cubit),
    );
  }

  Widget _buildUI({required BuildContext context, required LoginCubit cubit}) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _userDetails(context: context, cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userDetails({required BuildContext context, required LoginCubit cubit}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _userProfileView(),
        _user(text: 'UserName', icon: Icons.supervised_user_circle_rounded),
        _user(text: 'UserSurname', icon: Icons.supervised_user_circle_rounded),
        _user(text: 'email', icon: Icons.email),
        _user(text: 'country', icon: Icons.location_on),
        _user(text: 'country', icon: Icons.location_on),
        _logoutButton(context, cubit),
      ],
    );
  }

  Widget _user({required String text, required IconData icon}) {
    return Container(
      margin: const _WidgetPaddingAndMargin.marginAll(),
      padding: const _WidgetPaddingAndMargin.paddingAll(),
      width: MediaQuery.of(context).size.width * _WidgetSize().userWidth,
      height: MediaQuery.of(context).size.height * _WidgetSize().userHeight,
      decoration: _userBoxDecoration(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(text), Icon(icon, color: ProjectColor.flushOrange())]),
    );
  }

  BoxDecoration _userBoxDecoration() {
    return BoxDecoration(
      color: ProjectColor.whiteColor(),
      borderRadius: BorderRadius.circular(_WidgetSize().borderRadius),
      boxShadow: [_userBoxShadow()],
    );
  }

  BoxShadow _userBoxShadow() {
    return BoxShadow(
      color: ProjectColor.mortarGrey(),
      blurRadius: _WidgetSize().blurRadius,
      spreadRadius: _WidgetSize().spreadRadius,
      offset: Offset(_WidgetSize().offsetX, _WidgetSize().offsetY),
    );
  }

  Widget _userProfileView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _WidgetSize().userProfileWidth,
      height: MediaQuery.of(context).size.height * _WidgetSize().userProfileWidth,
      child: CircleAvatar(
          backgroundColor: ProjectColor.flushOrange(),
          child: Icon(Icons.person, size: _WidgetSize().circularAvatarIcon, color: ProjectColor.whiteColor())),
    );
  }

  Widget _logoutButton(BuildContext context, LoginCubit cubit) {
    final isLoading = context.watch<LoginCubit>().state.isLoading;
    var d = AppLocalizations.of(context);

    return Container(
      margin: const _WidgetPaddingAndMargin.marginAll(),
      child: MyButton(
        width: _WidgetSize().myButtonWidth,
        height: _WidgetSize().myButtonHeight,
        color: ProjectColor.redColor(),
        borderRadius: _WidgetSize().borderRadius,
        onTap: () async {
          await _logoutMethod(isLoading, cubit);
        },
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(d!.logout,
                style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().buttonFontSize, FontWeight.normal)),
      ),
    );
  }

  Future<void> _logoutMethod(bool isLoading, LoginCubit cubit) async {
    if (!isLoading) {
      await cubit.logout();
      await Future.delayed(Duration(milliseconds: _WidgetSize().milliseconds));
      if (!cubit.state.isLoading) {
        setState(() {});
        navigationService.pushNamedAndRemoveUntil(routePath);
      }
    }
  }
}

class _WidgetSize {
  final double myButtonHeight = 0.07;
  final double myButtonWidth = 0.8;
  final double myButtonFontSize = 17;
  final double borderRadius = 10;
  final double buttonFontSize = 18;
  final double userWidth = 0.8;
  final double userHeight = 0.07;
  final double blurRadius = 5;
  final double spreadRadius = 3;
  final double offsetX = 0;
  final double offsetY = 2;
  final double userProfileWidth = 0.5;
  final double userProfileHeight = 0.2;
  final double circularAvatarIcon = 70;

  final int milliseconds = 100;
}

class _WidgetPaddingAndMargin extends EdgeInsets {
  const _WidgetPaddingAndMargin.paddingAll() : super.all(8.0);
  const _WidgetPaddingAndMargin.marginAll() : super.all(8.0);
}
