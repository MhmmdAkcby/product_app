import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/widget/view_builder_card/product_lwb_widget.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
    required this.productId,
    required this.title,
  });
  final int productId;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
      ),
      body: ProductLwbWidget(
        filterId: productId,
      ),
    );
  }
}
