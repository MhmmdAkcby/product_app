import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_app/auth/model/login_model.dart';

abstract class ILoginService {
  late Dio dio;
  Future<bool> authenticateUser(LoginModel user);
}

class LoginService extends ILoginService {
  String apiUrl = 'https://dummyjson.com/auth/login';

  @override
  Future<bool> authenticateUser(LoginModel user) async {
    dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));
    try {
      Map<String, dynamic> requestData = {
        'username': user.username,
        'password': user.password,
      };
      final response = await dio.post(apiUrl, data: requestData);

      if (response.statusCode == HttpStatus.ok) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
