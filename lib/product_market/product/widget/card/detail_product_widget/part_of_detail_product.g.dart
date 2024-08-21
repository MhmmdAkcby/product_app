part of 'details_prdocut_widget.dart';

//Positoned Card
Positioned _smallCardShowImage(
  BuildContext context,
  String data,
  Color color,
  double bottom,
  double right,
  double width,
) {
  return Positioned(
    bottom: bottom,
    right: right,
    child: Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_WidgetSize().borderRadius),
        color: color,
      ),
      height: _WidgetSize().smalCardHeight,
      alignment: Alignment.center,
      child: Padding(
        padding: const _WidgetPadding.all(),
        child: Text(
          data,
          style: TextStyle(color: ProjectColor.whiteColor()),
        ),
      ),
    ),
  );
}

//price raiting
Widget _priceAndRaiting(AppLocalizations? d, double price, BuildContext context, double rating) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${d!.price}: \$$price',
        style: _textTheme(context, ProjectColor.whiteColor(), _WidgetSize().priceSizePrice, FontWeight.normal),
        textAlign: TextAlign.center,
      ),
      SizedBox(width: _WidgetSize().sizedBoxWidth),
      _buildRatingStars(rating),
    ],
  );
}

BoxDecoration _bottomPriceRaitingContainerDecoration() {
  return BoxDecoration(
      color: ProjectColor.greyShade9(), borderRadius: BorderRadius.circular(_WidgetSize().borderRadius));
}

//button
Widget myButton(BuildContext context, Function() onTap, String data, Color color) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * _WidgetSize().myButtonHeight,
    width: MediaQuery.of(context).size.width * _WidgetSize().myButtonWidth,
    child: MaterialButton(
      onPressed: onTap,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_WidgetSize().borderRadius)),
      child: Text(
        data,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ProjectColor.whiteColor(),
              fontSize: _WidgetSize().myButtonFontSize,
            ),
      ),
    ),
  );
}

// raiting stars
Widget _buildRatingStars(double rating) {
  int fullStars = rating.floor();
  int emptyStars = 5 - fullStars;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      for (int i = 0; i < fullStars; i++) Icon(Icons.star, color: ProjectColor.yellowColor()),
      for (int i = 0; i < emptyStars; i++) Icon(Icons.star_border, color: ProjectColor.yellowColor()),
    ],
  );
}

//Text Style
TextStyle? _textStyle(BuildContext context) {
  return textTheme(
    context,
    ProjectColor.darkColor(),
    _WidgetSize().titleSize,
    FontWeight.w500,
  );
}

TextStyle? _textTheme(
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

class _WidgetSize {
  final double titleSize = 15;
  final double priceSizePrice = 18;
  final double cardElevation = 10;
  final double borderRadius = 5;
  final double sizedBoxWidth = 10;

  final double smalCardHeight = 50;

  final double smallCardBottom1 = 30;
  final double smallCardRight1 = 5;
  final double smalCardWidth1 = 150;

  final double smallCardBottom2 = 300;
  final double smallCardRight2 = 250;
  final double smalCardWidth2 = 135;

  final double bottomPriceAndRatingContainerHeight = 0.11;

  final double myButtonHeight = 0.5;
  final double myButtonWidth = 0.4;
  final double myButtonFontSize = 17;
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.only() : super.only(top: 6, left: 8);
  const _WidgetPadding.all() : super.all(8);
  const _WidgetPadding.allx2() : super.all(16);
  const _WidgetPadding.scrolViewOnly() : super.only(bottom: 200);
  const _WidgetPadding.symmetric() : super.symmetric(vertical: 8.0);
}
