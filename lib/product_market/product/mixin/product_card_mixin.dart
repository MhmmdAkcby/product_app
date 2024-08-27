import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/widget/card/product_card_widget.dart';

mixin ProductCardMixin {
  Widget cardMixin({required BuildContext context, required Products? model}) {
    return _ProductListBuilderCard(
      model: model,
    );
  }
}

class _ProductListBuilderCard extends StatefulWidget {
  const _ProductListBuilderCard({
    super.key,
    required Products? model,
  }) : _model = model;
  final Products? _model;

  @override
  State<_ProductListBuilderCard> createState() => _ProductListBuilderCardState();
}

class _ProductListBuilderCardState extends State<_ProductListBuilderCard> {
  final GetIt _getIt = GetIt.instance;

  late NavigationService navigatorService;

  @override
  void initState() {
    super.initState();
    navigatorService = _getIt<NavigationService>();
  }

  @override
  Widget build(BuildContext context) {
    return ProductCardWidget(
      image: widget._model?.thumbnail ?? '',
      title: widget._model?.title ?? '',
      price: widget._model?.price ?? 0,
      rating: widget._model?.rating ?? 0,
      onTap: () {
        navigatorService.pushNamed("/prdLWB", arguments: widget._model?.id ?? 0);
      },
    );
  }
}
