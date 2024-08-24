import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/cubit/product_cubit_state.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/service/product_service.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  final IProductService _productService;

  ProductCubit(IProductService productService)
      : _productService = productService,
        super(const ProductCubitState());

  Future<void> fetchProductItemAdvance() async {
    if (state.item != null && state.item!.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));
    final response = await _productService.fetchProductItemAdvance();
    emit(state.copyWith(isLoading: false, item: response?.products ?? []));
  }

  void toggleShowText() {
    emit(state.copyWith(isAllTextShow: !state.isAllTextShow));
  }

  void searchProducts(String query) {
    if (query.isNotEmpty) {
      final allProducts = state.item ?? [];
      final filteredProducts = allProducts.where((product) {
        final titleLower = product.title!.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList();

      emit(state.copyWith(filterProducts: filteredProducts));
    } else {
      emit(state.copyWith(filterProducts: []));
    }
  }

  void addToCart(Products product) {
    final updatedCart = List<Products>.from(state.cartItems)..add(product);
    emit(state.copyWith(cartItems: updatedCart));
  }

  void removeProduct(Products product) {
    final updatedCart = List<Products>.from(state.cartItems)..remove(product);
    emit(state.copyWith(cartItems: updatedCart));
  }
}
