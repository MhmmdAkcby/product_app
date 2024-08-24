import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/cubit/product_cubit_state.dart';
import 'package:product_app/product_market/product/mixin/product_card_mixin.dart';
import 'package:product_app/product_market/product/utils/lottie/loading_lottie.dart';

mixin ProductLwbGwbMixin {
  Widget viewGridWB(String filterText) {
    return ProductBuilderCard(
      filterText: filterText,
      isGrid: true,
    );
  }

  Widget viewListWB(String filterText) {
    return ProductBuilderCard(
      filterText: filterText,
      isGrid: false,
    );
  }
}

class ProductBuilderCard extends StatelessWidget with ProductCardMixin {
  const ProductBuilderCard({
    super.key,
    required this.filterText,
    required this.isGrid,
  });

  final String filterText;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (isGrid ? 1 : _WidgetSize().sizedBoxHeight),
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingLottie();
          }
          final filteredProducts = state.item!.where((product) => product.category == filterText).toList();

          return isGrid
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _WidgetSize().crossAxisCountInt,
                    childAspectRatio: _WidgetSize().childAspectRatioDouble,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cardMixin(context: context, model: filteredProducts[index]);
                  },
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: filteredProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return cardMixin(context: context, model: filteredProducts[index]);
                  },
                );
        },
      ),
    );
  }
}

class _WidgetSize {
  final int crossAxisCountInt = 2;
  final double childAspectRatioDouble = 0.7;
  final double sizedBoxHeight = 0.37;
}
