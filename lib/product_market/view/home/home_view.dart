import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/cubit/product_cubit_state.dart';
import 'package:product_app/product_market/product/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/utils/project_string/project_string.dart';
import 'package:product_app/product_market/product/mixin/product_lwb_gwb_mixin.dart';
import 'package:product_app/product_market/product/widget/card/circular_card_widget.dart';
import 'package:product_app/product_market/product/widget/card/sale_card_widget.dart';
import 'package:product_app/product_market/product/widget/draw_widget/naw_drawer_widget.dart';
import 'package:product_app/product_market/product/widget/info_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/view/detail/detail_view.dart';
part 'home.g.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final GetIt _getIt = GetIt.instance;

late NavigationService navigatorService;

class _HomeViewState extends State<HomeView> with ProductLwbGwbMixin {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProductItemAdvance();
    navigatorService = _getIt<NavigationService>();
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
