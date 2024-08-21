import 'package:dio/dio.dart';
import 'package:product_app/product_market/product/constant/api_url.dart';

mixin ProjectServiceMixin {
  final service = Dio(BaseOptions(baseUrl: ApiUrl.apiBaseUrl));
}
