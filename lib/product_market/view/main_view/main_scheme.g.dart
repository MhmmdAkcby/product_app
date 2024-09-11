part of 'main scheme.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    super.key,
    required this.widget,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: MediaQuery.of(context).size.height * _WidgetSize().bottomAppbarHeight,
      elevation: _WidgetSize().tabElevation,
      shadowColor: ProjectColor.whiteColor(),
      color: ProjectColor.whiteColor(),
      shape: const CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      notchMargin: _WidgetSize()._notchMargin,
      child: widget,
    );
  }
}

enum _MyTabbarName { home, search, cart, allProduct }

extension _MyTabbarNameExtension on _MyTabbarName {
  IconData icons() {
    switch (this) {
      case _MyTabbarName.home:
        return Icons.home_filled;
      case _MyTabbarName.search:
        return Icons.search;
      case _MyTabbarName.cart:
        return Icons.shopping_cart_rounded;
      case _MyTabbarName.allProduct:
        return Icons.category;
    }
  }

  String getLocalizedName(AppLocalizations localizations) {
    switch (this) {
      case _MyTabbarName.home:
        return localizations.home;
      case _MyTabbarName.search:
        return localizations.tabSearch;
      case _MyTabbarName.cart:
        return localizations.cart;
      case _MyTabbarName.allProduct:
        return localizations.category;
    }
  }
}
