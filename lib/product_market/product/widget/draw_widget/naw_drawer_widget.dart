import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NawDrawerWidget extends StatelessWidget with CategoriesMixin {
  const NawDrawerWidget({super.key});

  final double _textFontSize = 30;

  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DrawerHeader(
              decoration: BoxDecoration(color: ProjectColor.flushOrange()),
              child: Text(
                d!.nawCategoriesName,
                style: textTheme(context, ProjectColor.whiteColor(), _textFontSize, FontWeight.w300),
              ),
            ),
          ),
          Expanded(child: categories(isCircular: false)),
        ],
      ),
    );
  }

  TextStyle? textTheme(
    BuildContext context,
    Color color,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
  }
}
