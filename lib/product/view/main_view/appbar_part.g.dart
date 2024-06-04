part of 'main scheme.dart';

class _PartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Product Market',
        style: _textTheme(context, ProjectColor.darkColor(), FontWeight.w300, _WidgetSize().appBarText),
      ),
      actions: [
        Text(
          'Welcome',
          style: _textTheme(context, ProjectColor.darkColor(), FontWeight.w300, _WidgetSize().welcomeTextSize),
        ),
        const Padding(
          padding: _AppBarPaddinng.all(),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
      ],
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