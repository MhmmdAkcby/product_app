import 'package:flutter/material.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/widget/card/product_card_widget.dart';
import 'package:product_app/product_market/product/widget/product_detail_widget.dart';

mixin ProductCardMixin {
  Widget cardMixin(BuildContext context, Products? model) {
    return _ProductListBuilderCard(
      model: model,
    );
  }
}

class _ProductListBuilderCard extends StatelessWidget {
  const _ProductListBuilderCard({
    super.key,
    required Products? model,
  }) : _model = model;
  final Products? _model;
  @override
  Widget build(BuildContext context) {
    return ProductCardWidget(
      image: _model?.thumbnail ?? '',
      title: _model?.title ?? '',
      price: _model?.price ?? 0,
      rating: _model?.rating ?? 0,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailWidget(
              productId: _model?.id ?? 0,
              title: _model?.title ?? '',
            ),
          ),
        );
      },
    );
  }
}
