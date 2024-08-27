import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.onTap,
      required this.data,
      required this.color,
      required this.height,
      required this.width,
      required this.textColor,
      required this.borderRadius,
      required this.fontSize,
      this.elevation});
  final Function() onTap;
  final String data;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
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
        child: Text(
          data,
          style: _textTheme(context, textColor, fontSize),
        ),
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
