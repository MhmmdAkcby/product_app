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
      body: _buildUI(context, cubit),
    );
  }

  Column _buildUI(BuildContext context, LoginCubit cubit) {
    return Column(
      children: [
        _logoutButton(context, cubit),
      ],
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
      await Future.delayed(const Duration(milliseconds: 100));
      if (!cubit.state.isLoading) {
        setState(() {});
        navigationService.pushNamedAndRemoveUntil('/login');
      }
    }
  }
}

class _WidgetSize {
  final double myButtonHeight = 0.07;
  final double myButtonWidth = 0.3;
  final double myButtonFontSize = 17;
  final double borderRadius = 10;
  final double buttonFontSize = 18;
}

class _WidgetPaddingAndMargin extends EdgeInsets {
  const _WidgetPaddingAndMargin.paddingAll() : super.all(8.0);
  const _WidgetPaddingAndMargin.marginAll() : super.all(8.0);
}
