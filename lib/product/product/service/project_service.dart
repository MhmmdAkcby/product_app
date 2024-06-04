import 'package:dio/dio.dart';

mixin ProjectServiceMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));
}
