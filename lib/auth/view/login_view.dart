import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:product_app/auth/cubit/login_cubit.dart';
import 'package:product_app/auth/cubit/login_cubit_state.dart';
import 'package:product_app/auth/view/login_view_state.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/utils/image_path.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            navigatorService.pushNamed("/main");
          } else if (state.message != null && state.message!.isNotEmpty) {
            showDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                title: const Text('Error'),
                content: Text(state.message!),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Ok'),
                    onPressed: () => navigatorService.goBack(),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return _buildUI(context);
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _infoText(
              text: 'Welcome Back!',
              textStyle: _textStyle(fontWeight: FontWeight.bold, fontSize: _WidgetSize().fontSize),
            ),
            _myLottie(context),
            _loginForm(context, cubit),
          ],
        ),
      ),
    );
  }

  SizedBox _myLottie(BuildContext context) => SizedBox(
      height: MediaQuery.of(context).size.height * _WidgetSize().lottieHeight,
      child: Lottie.asset(ImagePath.loginLottie.toImage()));

  Container _loginForm(BuildContext context, LoginCubit cubit) {
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
            hintText: 'UserName',
            icon: Icons.supervised_user_circle_rounded,
          ),
          inputBox(
            controller: cubit.state.password!,
            isSecured: true,
            hintText: 'Password',
            icon: Icons.lock,
          ),
          SizedBox(height: _WidgetSize().sizedBoxHeight),
          _myButton(context),
        ],
      ),
    );
  }

  Widget inputBox({
    required String hintText,
    required TextEditingController controller,
    required bool isSecured,
    required IconData icon,
  }) {
    return Container(
      padding: const _WidgetPadding.containerSymmetric(),
      margin: const _WidgetPadding.allMargin(),
      decoration: _inputBoxDecoration(),
      child: _textField(controller: controller, isSecured: isSecured, hintText: hintText, icon: icon),
    );
  }

  Widget _myButton(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return MyButton(
      data: 'Login',
      textColor: ProjectColor.whiteColor(),
      fontSize: _WidgetSize().buttonFontSize,
      width: _WidgetSize().myButtonWidth,
      height: _WidgetSize().myButtonHeight,
      color: ProjectColor.flushOrange(),
      borderRadius: _WidgetSize().buttonRadius,
      elevation: _WidgetSize().myButtonElevation,
      onTap: () async {
        await cubit.submit();
      },
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required bool isSecured,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      obscureText: isSecured,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(icon, color: ProjectColor.flushOrange()),
        hintText: hintText,
        fillColor: ProjectColor.whiteColor(),
        filled: true,
        contentPadding: const _WidgetPadding.contentPadding(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_WidgetSize().enabledBorderRadius),
          borderSide: BorderSide(color: ProjectColor.whiteColor(), width: _WidgetSize().enabledBorderSide),
        ),
      ),
    );
  }

  Text _infoText({required String text, TextStyle? textStyle}) => Text(text, style: textStyle);

  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: ProjectColor.mortarGrey()),
      borderRadius: BorderRadius.circular(_WidgetSize().borderRadius),
    );
  }

  TextStyle _textStyle({required FontWeight fontWeight, required double fontSize}) =>
      TextStyle(fontSize: fontSize, fontWeight: fontWeight);
}

class _WidgetSize {
  final double borderRadius = 10;
  final double fontSize = 40;
  final double myButtonHeight = 0.065;
  final double myButtonWidth = 1;
  final double myButtonFontSize = 17;
  final double buttonRadius = 10;
  final double buttonFontSize = 18;
  final double enabledBorderRadius = 5;
  final double enabledBorderSide = 3;
  final double myButtonElevation = 20;
  final double sizedBoxHeight = 50;
  final double lottieHeight = 0.3;
  final double containerHeight = 0.5;
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.allMargin() : super.all(8.0);
  const _WidgetPadding.containerSymmetric() : super.symmetric(horizontal: 15);
  const _WidgetPadding.contentPadding() : super.fromLTRB(20.0, 10.0, 20.0, 10.0);
}
