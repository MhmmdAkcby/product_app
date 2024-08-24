// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/product/utils/lottie/loading_lottie.dart';

import 'package:product_app/product_market/product/widget/card/detail_product_widget/details_prdocut_widget.dart';

import '../../../cubit/product_cubit.dart';
import '../../../cubit/product_cubit_state.dart';
import '../../../model/product_model.dart';

class ProductLwbWidget extends StatefulWidget {
  final int? filterId;

  const ProductLwbWidget({super.key, this.filterId});

  @override
  State<ProductLwbWidget> createState() => _ProductLwbWidgetState();
}

class _ProductLwbWidgetState extends State<ProductLwbWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductItemAdvance();
  }

  @override
  Widget build(BuildContext context) {
    final int? filterId = ModalRoute.of(context)?.settings.arguments as int?;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<ProductCubit, ProductCubitState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingLottie();
          }

          final product = state.item!.firstWhere((product) => product.id == filterId);

          return _ProductListBuilderCard(model: product);
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
    return DetailsProductWidget(
      id: _model?.id ?? 0,
      image: _model?.images?.last ?? '',
      title: _model?.title ?? '',
      description: _model?.description ?? '',
      price: _model?.price ?? 0,
      rating: _model?.rating ?? 0,
      stock: _model?.stock ?? 0,
      category: _model?.category ?? '',
      tags: _model?.tags?.last ?? '',
      brands: _model?.brand ?? '',
      dimensionsDeth: _model?.dimensions?.depth ?? 0,
      dimensionsHeight: _model?.dimensions?.height ?? 0,
      dimensionsWidht: _model?.dimensions?.width ?? 0,
      availabilityStatus: _model?.availabilityStatus ?? '',
      shippingInformation: _model?.shippingInformation ?? '',
      warrantyInformation: _model?.warrantyInformation ?? '',
      reviews: _model?.reviews ?? [],
    );
  }
}
