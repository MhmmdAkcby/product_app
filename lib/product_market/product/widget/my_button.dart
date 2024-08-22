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
      required this.fontSize});
  final Function() onTap;
  final String data;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: MaterialButton(
        onPressed: onTap,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: Text(
          data,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
