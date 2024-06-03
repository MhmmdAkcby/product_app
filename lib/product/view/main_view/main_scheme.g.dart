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
      color: ProjectColor.superSilver(),
      shape: const CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
      notchMargin: _WidgetSize()._notchMargin,
      child: widget,
    );
  }
}

class _FabWidget extends StatelessWidget {
  const _FabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: _WidgetSize().fabElevation,
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add));
  }
}

enum _MyTabbarName { home, search, cart, profile }

extension _MyTabbarNameExtension on _MyTabbarName {
  IconData icons() {
    switch (this) {
      case _MyTabbarName.home:
        return Icons.home_filled;
      case _MyTabbarName.search:
        return Icons.search;
      case _MyTabbarName.cart:
        return Icons.shopping_cart_rounded;
      case _MyTabbarName.profile:
        return Icons.person;
    }
  }
}
