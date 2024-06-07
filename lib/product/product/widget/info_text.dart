import 'package:flutter/material.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  });
  final String text;
  final String buttonText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const _WidgetSize.all(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: textTheme(context, ProjectColor.darkColor(), 30, FontWeight.bold)),
            TextButton(onPressed: onTap, child: Text(buttonText))
          ],
        ),
      ),
    );
  }
}

class _WidgetSize extends EdgeInsets {
  const _WidgetSize.all() : super.all(8);
}
