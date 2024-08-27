import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/view/search/search_view.dart';

abstract class SearchState<T extends SearchView> extends State<T> {
  String query = "";

  final GetIt _getIt = GetIt.instance;

  late NavigationService navigatorService;

  @override
  void initState() {
    super.initState();
    navigatorService = _getIt<NavigationService>();
  }
}
