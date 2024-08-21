part of 'search_view.dart';

InputDecoration _searchInputDecoration(AppLocalizations? d) {
  return InputDecoration(
    hintText: d!.search,
    suffixIcon: const Icon(Icons.search),
    border: InputBorder.none,
  );
}

BoxDecoration _searchDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(_WidgetSize().searchBarRadius),
    color: ProjectColor.whiteColor(),
    boxShadow: [
      BoxShadow(
        spreadRadius: _WidgetSize().spreadRadius,
        blurRadius: _WidgetSize().blurRadius,
        color: ProjectColor.searchDecorationColor().withOpacity(_WidgetSize().opacity),
        offset: Offset(_WidgetSize().ofsetX, _WidgetSize().ofsetY),
      ),
    ],
  );
}

class _WidgetSize {
  final double imagesize = 50;
  final double searchBarRadius = 30;
  final double spreadRadius = 5;
  final double blurRadius = 7;
  final double ofsetX = 0;
  final double ofsetY = 3;
  final double opacity = 0.4;
}

class _WidgetPaddingAndMargin extends EdgeInsets {
  const _WidgetPaddingAndMargin.symmetricHorizontal() : super.symmetric(horizontal: 20);
  const _WidgetPaddingAndMargin.symetricMargin() : super.symmetric(vertical: 10, horizontal: 20);
}
