part of 'login_view.dart';

SizedBox _myLottie(BuildContext context) => SizedBox(
    height: MediaQuery.of(context).size.height * _WidgetSize().lottieHeight,
    child: Lottie.asset(ImagePath.loginLottie.toImage()));

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

Widget _textField({
  required TextEditingController controller,
  required bool isSecured,
  required String hintText,
  required IconData icon,
}) {
  return TextField(
    controller: controller,
    obscureText: isSecured,
    decoration: _textFieldDecoration(hintText: hintText, icon: icon),
  );
}

Text _infoText({required String text, TextStyle? textStyle}) => Text(text, style: textStyle);

InputDecoration _textFieldDecoration({required IconData icon, required String hintText}) {
  return InputDecoration(
    border: InputBorder.none,
    icon: Icon(icon, color: ProjectColor.flushOrange()),
    hintText: hintText,
    fillColor: ProjectColor.whiteColor(),
    filled: true,
    contentPadding: const _WidgetPadding.contentPadding(),
    enabledBorder: _enabledBorder(),
  );
}

OutlineInputBorder _enabledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(_WidgetSize().enabledBorderRadius),
    borderSide: BorderSide(color: ProjectColor.whiteColor(), width: _WidgetSize().enabledBorderSide),
  );
}

BoxDecoration _inputBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: ProjectColor.mortarGrey()),
    borderRadius: BorderRadius.circular(_WidgetSize().borderRadius),
  );
}

TextStyle _textStyle({required FontWeight fontWeight, required double fontSize}) =>
    TextStyle(fontSize: fontSize, fontWeight: fontWeight);

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
