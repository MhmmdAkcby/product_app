import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';

abstract class HomeState<T extends StatefulWidget> extends State<T> {
  final GetIt _getIt = GetIt.instance;

  late NavigationService navigatorService;

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductItemAdvance();
    navigatorService = _getIt<NavigationService>();
  }
}
