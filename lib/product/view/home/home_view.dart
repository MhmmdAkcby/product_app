import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/card/circular_card_widget.dart';
import 'package:product_app/product/product/widget/card/sale_card_widget.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';
import 'package:product_app/product/product/widget/info_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product/product/widget/list_view_builder_card/product_list_builder_card_widget.dart';
part 'home.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductItemAdvance();
  }

  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Sale Card1
            SaleCardWidget(
              mainText: d!.saleCardMainText,
              description: d.saleCardDescription,
              icon: Icons.shopify_outlined,
              onTap: () {},
            ),
            // Categories
            InfoText(text: d.categoriesHomeViewText, buttonText: d.infoTextButtonText, onTap: () {}),
            const _ProductCategory(),

            // Beauty Categories
            InfoText(text: d.infoTextBeautyText, buttonText: d.infoTextButtonText, onTap: () {}),
            const ProductListBuilderCardWidget(filterText: 'beauty'),

            //Sale Card2
            SaleCardWidget(
              mainText: d.saleCardMainText,
              description: d.saleCardDescription,
              icon: Icons.food_bank,
              onTap: () {},
              colorBegin: ProjectColor.flushOrange(),
              colorEnd: ProjectColor.darkColor(),
            ),

            // Groceries Categories
            InfoText(text: d.infoTextGroceriesText, buttonText: d.infoTextButtonText, onTap: () {}),
            const ProductListBuilderCardWidget(filterText: 'groceries'),

            // Fragrances Categories
            InfoText(text: d.infoTextFragrancesText, buttonText: d.infoTextButtonText, onTap: () {}),
            const ProductListBuilderCardWidget(filterText: 'fragrances'),

            // Sale Card3
            SaleCardWidget(
              mainText: d.saleCardMainText,
              description: d.saleCardDescription,
              icon: Icons.add_business_sharp,
              onTap: () {},
              colorBegin: ProjectColor.flushOrange(),
              colorEnd: ProjectColor.trustedPurple(),
            ),

            // Furniture Categories
            InfoText(text: d.infoTextFurnitureText, buttonText: d.infoTextButtonText, onTap: () {}),
            const ProductListBuilderCardWidget(filterText: 'furniture'),
          ],
        ),
      ),
    );
  }
}
