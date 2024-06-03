import 'package:flutter/material.dart';
import 'package:product_app/product/product/widget/card/product_card_widget.dart';
import 'package:product_app/product/product/widget/card/sale_card_widget.dart';

import '../../product/widget/card/circular_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: _WidgetPadding.all(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularCardWidget(text: 'data'),
                  CircularCardWidget(text: 'data'),
                  CircularCardWidget(text: 'data'),
                  CircularCardWidget(text: 'data'),
                ],
              ),
            ),
            Padding(
              padding: _WidgetPadding.all(),
              child: Column(
                children: [
                  Padding(
                    padding: _WidgetPadding.onlyRight(),
                    child: Text('data'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: _WidgetPadding.all(),
              child: SaleCardWidget(),
            ),
            Padding(
              padding: _WidgetPadding.all(),
              child: Column(
                children: [
                  Padding(
                    padding: _WidgetPadding.onlyRight(),
                    child: Text('data'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                      ProductCardWidget(textData: 'data', image: 'https://picsum.photos/200'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WidgetPadding extends EdgeInsets {
  const _WidgetPadding.all() : super.all(8);
  const _WidgetPadding.onlyRight() : super.only(right: 340);
}
