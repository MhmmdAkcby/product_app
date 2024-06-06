import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';

class SaleCardWidget extends StatelessWidget {
  const SaleCardWidget(
      {super.key,
      required this.mainText,
      required this.description,
      required this.onTap,
      required this.icon,
      this.colorBegin = Colors.red,
      this.colorEnd = Colors.deepOrange});
  final String mainText;
  final String description;
  final Function() onTap;
  final IconData icon;
  final Color colorBegin;
  final Color colorEnd;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const _WidgetEdgeInsets.all(),
        padding: const _WidgetEdgeInsets.all(),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(_WidgetSize().borderRadius)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorBegin, colorEnd],
          ),
        ),
        height: _WidgetSize().containerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  mainText,
                  style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().mainTextFontSize, FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  icon,
                  size: _WidgetSize().iconSize,
                  color: ProjectColor.amberColor(),
                )
              ],
            ),
            Text(
              description,
              style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().descriptionFontSize, FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class _WidgetEdgeInsets extends EdgeInsets {
  const _WidgetEdgeInsets.all() : super.all(8);
}

class _WidgetSize {
  final double containerHeight = 200;
  final double borderRadius = 10;
  final double iconSize = 150;
  final double mainTextFontSize = 80;
  final double descriptionFontSize = 20;
}
