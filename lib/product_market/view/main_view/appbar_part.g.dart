part of 'main scheme.dart';

class _PartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return AppBar(
      title: Text(
        d!.appBarTitle,
        style: _textTheme(context, ProjectColor.darkColor(), FontWeight.w300, _WidgetSize().appBarText),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  TextStyle? _textTheme(BuildContext context, Color color, FontWeight fontWeight, double fontSize) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        );
  }
}
