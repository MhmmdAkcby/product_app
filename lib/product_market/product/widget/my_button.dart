import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.color,
    required this.height,
    required this.width,
    required this.borderRadius,
    this.elevation,
  });

  final Function() onTap;
  final Widget child;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: MaterialButton(
        elevation: elevation,
        onPressed: onTap,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: child,
      ),
    );
  }

  TextStyle? _textTheme(BuildContext context, Color textColor, double fontSize) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: textColor,
          fontSize: fontSize,
        );
  }
}
