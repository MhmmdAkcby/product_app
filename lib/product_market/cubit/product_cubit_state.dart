import 'package:equatable/equatable.dart';
import '../model/product_model.dart';

class ProductCubitState extends Equatable {
  final bool isLoading;
  final bool isAllTextShow;
  final List<Products>? filterProducts;
  final List<Products>? item;
  final List<Products> cartItems;

  const ProductCubitState({
    this.filterProducts,
    this.isLoading = false,
    this.item,
    this.isAllTextShow = false,
    this.cartItems = const [],
  });

  @override
  List<Object?> get props => [isLoading, item, isAllTextShow, filterProducts, cartItems];

  ProductCubitState copyWith({
    bool? isLoading,
    bool? isAllTextShow,
    List<Products>? item,
    List<Products>? filterProducts,
    List<Products>? cartItems,
  }) {
    return ProductCubitState(
      isLoading: isLoading ?? this.isLoading,
      isAllTextShow: isAllTextShow ?? this.isAllTextShow,
      item: item ?? this.item,
      filterProducts: filterProducts ?? this.filterProducts,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
