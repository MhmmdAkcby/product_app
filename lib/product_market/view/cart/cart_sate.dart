import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/service/alert_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/view/cart/cart_view.dart';

abstract class CartSate<T extends CartView> extends State<T> {
  late AlertService alertService;
  late NavigationService navigatorService;

  final GetIt _getIt = GetIt.instance;

  @override
  void initState() {
    super.initState();
    alertService = _getIt<AlertService>();
    navigatorService = _getIt<NavigationService>();
  }

  void showToast() {
    var d = AppLocalizations.of(context);
    alertService.showToast(
      text: d!.productDeleteInfo,
      icon: Icons.delete,
      iconColor: ProjectColor.redColor(),
    );
  }

  void deleteFunction(Products product) {
    context.read<ProductCubit>().removeProduct(product);
  }
}
