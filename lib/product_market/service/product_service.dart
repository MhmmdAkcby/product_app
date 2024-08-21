import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:product_app/product_market/model/product_model.dart';

abstract class IProductService {
  IProductService(this.dio);
  final Dio dio;

  Future<ProductModel?> fetchProductItemAdvance();
}

enum _ProductPathItem { products }

class ProductService extends IProductService {
  ProductService(super.dio);

  @override
  Future<ProductModel?> fetchProductItemAdvance() async {
    try {
      final response = await dio.get(_ProductPathItem.products.name);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;

        if (jsonBody is Map<String, dynamic>) {
          return ProductModel.fromJson(jsonBody);
        }
      }
    } on DioException catch (exception) {
      _ShowException()._showDioException(exception, this);
    }
    return null;
  }
}

class _ShowException {
  void _showDioException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('----------------------------------------');
    }
  }
}
