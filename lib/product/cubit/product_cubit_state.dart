import 'package:equatable/equatable.dart';

import '../model/product_model.dart';

class ProductCubitState extends Equatable {
  final bool isLoading;
  final List<Products>? item;
  const ProductCubitState({this.isLoading = false, this.item});

  @override
  List<Object?> get props => [isLoading, item];

  ProductCubitState copyWith({
    bool? isLoading,
    List<Products>? item,
  }) {
    return ProductCubitState(
      isLoading: isLoading ?? this.isLoading,
      item: item ?? this.item,
    );
  }
}
