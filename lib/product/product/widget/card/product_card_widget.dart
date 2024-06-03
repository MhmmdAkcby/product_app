import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.textData,
    required this.image,
  });
  final String textData;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Card(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * _WidgetSize().sizeBoxHeight,
              width: MediaQuery.of(context).size.height * _WidgetSize().sizeBoxWeight,
              child: Column(children: [_image(), _text()]),
            ),
          ),
        ],
      ),
    );
  }

  Image _image() => Image.network(image, fit: BoxFit.fitWidth);

  Container _text() => Container(padding: const _WidgetPadding.all(), child: Text(textData));
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.all() : super.all(12);
}

class _WidgetSize {
  final double sizeBoxHeight = 0.25;
  final double sizeBoxWeight = 0.19;
}
