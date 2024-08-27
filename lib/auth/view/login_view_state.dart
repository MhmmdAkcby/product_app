import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/auth/view/login_view.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/service/alert_service.dart';

abstract class LoginViewState<T extends LoginView> extends State<T> {
  late NavigationService navigatorService;
  late AlertService alertService;
  final GetIt _getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    alertService = _getIt<AlertService>();
    navigatorService = _getIt<NavigationService>();
  }
}
