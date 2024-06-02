import 'package:flutter/material.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';

class NawDrawerWidget extends StatelessWidget {
  const NawDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ProjectColor.flushOrange()),
            child: Text(
              'Categories',
              style: textTheme(context, ProjectColor.whiteColor(), 30, FontWeight.w300),
            ),
          ),
          ListTile(onTap: () => Navigator.of(context).pop(), title: const Text('Cars')),
          ListTile(onTap: () => Navigator.of(context).pop(), title: const Text('Tecnology')),
          ListTile(onTap: () => Navigator.of(context).pop(), title: const Text('Moda')),
        ],
      ),
    );
  }
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
