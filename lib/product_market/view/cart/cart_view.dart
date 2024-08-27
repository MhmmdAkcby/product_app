import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/mixin/alert_mixin.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/widget/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/view/cart/cart_sate.dart';

class CartView extends StatefulWidget {
  final int? filterId;
  const CartView({super.key, this.filterId});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends CartSate<CartView> with AlertMixin {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<ProductCubit>().state.cartItems;
    var d = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(d!.myCart)),
      body: _cartProduct(cartItems),
    );
  }

  Widget _cartProduct(List<Products> cartItems) {
    var d = AppLocalizations.of(context);
    final totalPrice = cartItems.fold<double>(0.0, (sum, product) {
      final price = product.price ?? 0.0;
      return sum + price;
    });

    return Column(
      children: [
        if (cartItems.isEmpty) Center(child: Text(d!.noItem)),
        ...cartItems.map((product) => Card(
              color: ProjectColor.whiteColor(),
              child: _showProduct(product),
            )),
        if (cartItems.isNotEmpty) _totalPrice(context: context, totalPrice: totalPrice),
      ],
    );
  }

  Widget _showProduct(Products product) {
    var d = AppLocalizations.of(context);
    return ListTile(
      leading:
          Image.network(product.images?.first ?? '', width: _WidgetSize().imageSize, height: _WidgetSize().imageSize),
      title: Text(product.title ?? ''),
      subtitle: Text('\$${product.price.toString()}'),
      trailing: IconButton(
        onPressed: () {
          showAlertMixin(
            context: context,
            child: _alertButton(product: product),
            data: d!.alertInfoText,
          );
        },
        icon: const Icon(Icons.delete),
      ),
      onTap: () {
        navigatorService.pushNamed("/prdLWB", arguments: product.id ?? 0);
      },
    );
  }

  Widget _alertButton({required Products product}) {
    var d = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _textButton(
          texData: d!.cancelButtonText,
          onPressed: () {
            navigatorService.goBack();
          },
        ),
        _textButton(
          texData: d.deleteButtonText,
          onPressed: () {
            deleteFunction(product);
            showToast();
            navigatorService.goBack();
          },
        ),
      ],
    );
  }

  Widget _textButton({required String texData, required Function()? onPressed}) {
    return TextButton(
      onPressed: onPressed,
      child: Text(texData),
    );
  }

  Widget _totalPrice({required BuildContext context, required double totalPrice}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: ProjectColor.whiteColor(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _priceText(totalPrice: totalPrice),
            _myButton(),
          ],
        ),
      ),
    );
  }

  Widget _priceText({required double totalPrice}) {
    var d = AppLocalizations.of(context);
    return Padding(
      padding: const _WidgetPadding.all(),
      child: Text(
        '${d!.totalPrice}: \$${totalPrice.toStringAsFixed(_WidgetSize().asFixed)}',
        style: TextStyle(fontSize: _WidgetSize().fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _myButton() {
    var d = AppLocalizations.of(context);
    return MyButton(
      width: _WidgetSize().myButtonWidth,
      height: _WidgetSize().myButtonHeight,
      color: ProjectColor.flushOrange(),
      borderRadius: _WidgetSize().borderRadius,
      onTap: () {},
      child: Text(
        d!.buy,
        style: textTheme(context, ProjectColor.whiteColor(), _WidgetSize().buttonFontSize, FontWeight.normal),
      ),
    );
  }
}

class _WidgetSize {
  final double imageSize = 50;
  final double fontSize = 18;
  final double myButtonHeight = 0.07;
  final double myButtonWidth = 0.3;
  final double myButtonFontSize = 17;
  final double borderRadius = 10;
  final double buttonFontSize = 18;

  final int asFixed = 2;
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.all() : super.all(8.0);
}
