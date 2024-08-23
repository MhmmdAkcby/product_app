import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';

import '../mixin/categories_mixin.dart';

class InfoText extends StatelessWidget {
  const InfoText({
    super.key,
    required this.text,
    this.buttonText,
    this.onTap,
  });
  final String text;
  final String? buttonText;
  final Function()? onTap;
  final double fontSize = 30;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const _WidgetSize.all(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: textTheme(context, ProjectColor.darkColor(), fontSize, FontWeight.bold)),
            TextButton(onPressed: onTap, child: Text(buttonText ?? ''))
          ],
        ),
      ),
    );
  }
}

class _WidgetSize extends EdgeInsets {
  const _WidgetSize.all() : super.all(8);
}
