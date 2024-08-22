import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/widget/view_builder_card/product_lwb_widget.dart';
import 'package:product_app/product_market/view/cart/cart_view.dart';
import 'package:product_app/product_market/view/detail/detail_view.dart';
import 'package:product_app/product_market/view/home/home_view.dart';
import 'package:product_app/product_market/view/main_view/main%20scheme.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final Map<String, Widget Function(BuildContext)> _routes = {
    "/main": (context) => const MainScheme(),
    "/home": (context) => const HomeView(),
    "/prdLWB": (context) => const ProductLwbWidget(),
    "/detailView": (context) => const DetailView(),
    "/cart": (context) => const CartView(),
  };

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Map<String, Widget Function(BuildContext)> get routes => _routes;

  void pushNamed(String routeName, {Object? arguments}) {
    _navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    _navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  void goBack() {
    _navigatorKey.currentState?.pop();
  }
}
