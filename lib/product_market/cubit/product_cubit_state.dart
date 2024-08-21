import 'package:equatable/equatable.dart';

import '../model/product_model.dart';

class ProductCubitState extends Equatable {
  final bool isLoading;
  final bool isAllTextShow;

  final List<Products>? filterProducts;
  final List<Products>? item;
  const ProductCubitState({this.filterProducts, this.isLoading = false, this.item, this.isAllTextShow = false});

  @override
  List<Object?> get props => [isLoading, item, isAllTextShow, filterProducts];

  ProductCubitState copyWith({
    bool? isLoading,
    bool? isAllTextShow,
    List<Products>? item,
    List<Products>? filterProducts,
  }) {
    return ProductCubitState(
      isLoading: isLoading ?? this.isLoading,
      isAllTextShow: isAllTextShow ?? this.isAllTextShow,
      item: item ?? this.item,
      filterProducts: filterProducts ?? this.filterProducts,
    );
  }
}
