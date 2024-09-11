import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.rating,
      required this.onTap});
  final String image;
  final String title;
  final double price;
  final double rating;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const _WidgetPadding.all(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * _WidgetSize().width,
          child: Card(
            color: ProjectColor.whiteColor(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(image, fit: BoxFit.cover),
                const Divider(),
                Padding(
                  padding: const _WidgetPadding.only(),
                  child: Text(
                    title,
                    style: textTheme(context, ProjectColor.darkColor(), _WidgetSize().titleSize, FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _priceAndRatingInfoText(context: context, price: price.toString(), rating: rating.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _priceAndRatingInfoText({required BuildContext context, required String price, required String rating}) {
  return Padding(
    padding: const _WidgetPadding.only(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Price : $price\$',
          style: textTheme(context, ProjectColor.darkColor(), _WidgetSize().priceSize, FontWeight.normal),
        ),
      ],
    ),
  );
}

class _WidgetSize {
  final double width = 0.4;
  final double titleSize = 15;
  final double priceSize = 17;
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.only() : super.only(top: 6, left: 8);
  const _WidgetPadding.all() : super.all(8);
}
