part of 'user_view.dart';

Widget _utext(String text, BuildContext context) {
  return Expanded(
      child: Text(text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: _WidgetSize().buttonFontSize, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          softWrap: true,
          overflow: TextOverflow.ellipsis));
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
}

class _WidgetPaddingAndMargin extends EdgeInsets {
  const _WidgetPaddingAndMargin.paddingAll() : super.all(8.0);
  const _WidgetPaddingAndMargin.marginAll() : super.all(8.0);
}
