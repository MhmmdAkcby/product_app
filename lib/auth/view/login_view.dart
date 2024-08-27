import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/auth/cubit/login_cubit_state.dart';
import 'package:product_app/auth/view/login_view_state.dart';
import 'package:product_app/product_market/product/mixin/alert_mixin.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/utils/image_path.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'login.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewState<LoginView> with AlertMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            navigatorService.pushNamed("/main");
          } else if (state.message != null && state.message!.isNotEmpty) {
            _cupertinoAlert(context, state);
          }
        },
        builder: (context, state) {
          return _buildUI(context);
        },
      ),
    );
  }

  Future<void> _cupertinoAlert(BuildContext context, LoginCubitState state) {
    var d = AppLocalizations.of(context);
    return showCupertinoMixin(
      context: context,
      title: d!.error,
      message: state.message!,
      child: CupertinoDialogAction(
        child: Text(d.ok),
        onPressed: () => navigatorService.goBack(),
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    var d = AppLocalizations.of(context);
    final cubit = context.read<LoginCubit>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _infoText(
              text: d!.welcome,
              textStyle: _textStyle(fontWeight: FontWeight.bold, fontSize: _WidgetSize().fontSize),
            ),
            _myLottie(context),
            _loginForm(context, cubit),
          ],
        ),
      ),
    );
  }

  Container _loginForm(BuildContext context, LoginCubit cubit) {
    var d = AppLocalizations.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * _WidgetSize().containerHeight,
      padding: const _WidgetPadding.containerSymmetric(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          inputBox(
            controller: cubit.state.username!,
            isSecured: false,
            hintText: d!.userName,
            icon: Icons.supervised_user_circle_rounded,
          ),
          inputBox(
            controller: cubit.state.password!,
            isSecured: true,
            hintText: d.password,
            icon: Icons.lock,
          ),
          SizedBox(height: _WidgetSize().sizedBoxHeight),
          _myButton(context),
        ],
      ),
    );
  }

  Widget _myButton(BuildContext context) {
    var d = AppLocalizations.of(context);
    final cubit = context.read<LoginCubit>();
    final isLoading = context.watch<LoginCubit>().state.isLoading;

    return MyButton(
      width: _WidgetSize().myButtonWidth,
      height: _WidgetSize().myButtonHeight,
      color: ProjectColor.flushOrange(),
      borderRadius: _WidgetSize().buttonRadius,
      elevation: _WidgetSize().myButtonElevation,
      onTap: () async {
        await cubit.submit();
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator(color: ProjectColor.whiteColor()))
          : Text(
              d!.login,
              style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().buttonFontSize, FontWeight.normal),
            ),
    );
  }
}
