import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';

class CircularCardWidget extends StatelessWidget {
  const CircularCardWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.data,
  });
  final String text;
  final String data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const _MyEdgeInsets.all(),
          height: MediaQuery.of(context).size.height * _WidgetSize().containerSize,
          width: MediaQuery.of(context).size.height * _WidgetSize().containerSize,
          child: InkWell(
            onTap: onTap,
            child: Card(
              color: ProjectColor.flushOrange(),
              elevation: _WidgetSize().elevation,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_WidgetSize().radius))),
              child: Center(
                  child: Text(
                text,
                style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().textFontSize, FontWeight.bold),
              )),
            ),
          ),
        ),
        Text(
          data,
          style: textTheme(context, ProjectColor.darkColor(), _WidgetSize().dataSize, FontWeight.bold),
        ),
      ],
    );
  }
}

class _MyEdgeInsets extends EdgeInsets {
  const _MyEdgeInsets.all() : super.all(4);
  const _MyEdgeInsets.bottom() : super.only(bottom: 120);
}

class _WidgetSize {
  final double containerSize = 0.10;
  final double radius = 18;
  final double elevation = 18;
  final double textFontSize = 25;
  final double dataSize = 15;
}
