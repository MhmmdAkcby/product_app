import 'package:flutter/material.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';

class CircularCardWidget extends StatelessWidget {
  const CircularCardWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const _MyEdgeInsets.all(),
      height: MediaQuery.of(context).size.height * _WidgetSize().containerSize,
      width: MediaQuery.of(context).size.height * _WidgetSize().containerSize,
      child: InkWell(
        onTap: () {},
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
}
