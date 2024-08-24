import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/categories_mixin.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/utils/project_string.dart';
import 'package:product_app/product_market/product/mixin/product_lwb_gwb_mixin.dart';
import 'package:product_app/product_market/product/widget/card/sale_card_widget.dart';
import 'package:product_app/product_market/product/widget/info_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/view/home/home_state.dart';
part 'home.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeState<HomeView> with ProductLwbGwbMixin {
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
            InfoText(text: d.categoriesHomeViewText),
            const _ProductCategory(),

            // Beauty Categories
            InfoText(
              text: d.infoTextBeautyText,
              buttonText: d.infoTextButtonText,
              onTap: () {
                navigatorService.pushNamed("/detailView", arguments: ProjectString.beauty.projectToString());
              },
            ),
            viewListWB(ProjectString.beauty.projectToString()),

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
            InfoText(
              text: d.infoTextGroceriesText,
              buttonText: d.infoTextButtonText,
              onTap: () {
                navigatorService.pushNamed("/detailView", arguments: ProjectString.groceries.projectToString());
              },
            ),
            viewListWB(ProjectString.groceries.projectToString()),

            // Fragrances Categories
            InfoText(
              text: d.infoTextFragrancesText,
              buttonText: d.infoTextButtonText,
              onTap: () {
                navigatorService.pushNamed("/detailView", arguments: ProjectString.fragrances.projectToString());
              },
            ),
            viewListWB(ProjectString.fragrances.projectToString()),

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
            InfoText(
              text: d.infoTextFurnitureText,
              buttonText: d.infoTextButtonText,
              onTap: () {
                navigatorService.pushNamed("/detailView", arguments: ProjectString.furniture.projectToString());
              },
            ),
            viewListWB(ProjectString.furniture.projectToString()),
          ],
        ),
      ),
    );
  }
}
