import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/product_cubit.dart';
import '../../../cubit/product_cubit_state.dart';
import '../../../model/product_model.dart';
import '../card/product_card_widget.dart';

class ProductListBuilderCardWidget extends StatelessWidget {
  const ProductListBuilderCardWidget({
    super.key,
    required this.filterText,
  });
  final String filterText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _WidgetSize().sizedBoxHeight,
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final filteredProducts = state.item!.where((product) => product.category == filterText).toList();

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return _ProductListBuilderCard(model: filteredProducts[index]);
            },
          );
        },
      ),
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
      onTap: () {},
    );
  }
}

class _WidgetSize {
  final int length = 0;
  final int flexSize = 6;
  final double sizedBoxHeight = 280;
}
