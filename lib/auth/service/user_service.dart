import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:product_app/auth/model/user_model.dart';

abstract class IUserService {
  IUserService(this.dio);
  final Dio dio;

  Future<UserModel?> fetchUserItem();
}

enum _UserPathItem { user }

class UserService extends IUserService {
  UserService(super.dio);

  @override
  Future<UserModel?> fetchUserItem() async {
    try {
      final response = await dio.get(_UserPathItem.user.name);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;

        if (jsonBody is Map<String, dynamic>) {
          return UserModel.fromJson(jsonBody);
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
