import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';
import 'package:product_app/product/service/product_service.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  ProductCubit(IProductService productService)
      : _productService = productService,
        super(const ProductCubitState());

  final IProductService _productService;

  Future<void> fetchProductItemAdvance() async {
    emit(state.copyWith(isLoading: true));
    final response = await _productService.fetchProductItemAdvance();
    emit(state.copyWith(isLoading: false, item: response?.products ?? []));
  }
}
