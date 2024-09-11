import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';

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
        decoration: _containerDecoration(),
        height: _WidgetSize().containerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_mainText(context), _iconMethod()],
            ),
            _descriptionText(context)
          ],
        ),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(_WidgetSize().borderRadius)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [colorBegin, colorEnd],
      ),
    );
  }

  Text _descriptionText(BuildContext context) {
    return Text(
      description,
      style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().descriptionFontSize, FontWeight.w400),
      overflow: TextOverflow.ellipsis,
    );
  }

  Icon _iconMethod() {
    return Icon(
      icon,
      size: _WidgetSize().iconSize,
      color: ProjectColor.amberColor(),
    );
  }

  Text _mainText(BuildContext context) {
    return Text(
      mainText,
      style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().mainTextFontSize, FontWeight.bold),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _WidgetEdgeInsets extends EdgeInsets {
  const _WidgetEdgeInsets.all() : super.all(8);
}

class _WidgetSize {
  final double containerHeight = 200;
  final double borderRadius = 10;
  final double iconSize = 140;
  final double mainTextFontSize = 80;
  final double descriptionFontSize = 20;
}
