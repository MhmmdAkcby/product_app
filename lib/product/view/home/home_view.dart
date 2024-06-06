import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';
import 'package:product_app/product/model/product_model.dart';
import 'package:product_app/product/product/widget/card/circular_card_widget.dart';
import 'package:product_app/product/product/widget/card/product_card_widget.dart';
import 'package:product_app/product/product/widget/card/sale_card_widget.dart';
import 'package:product_app/product/product/widget/info_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'home.g.dart';
part 'home_beauty_product.g.dart';

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
            const _ProductCategory(),
            InfoText(text: d!.infoTextBeautyText, buttonText: d.infoTextBeautyButtonText, onTap: () {}),
            const _ProdoctBeautyList(),
            SaleCardWidget(
              mainText: d.saleCardMainText,
              description: d.saleCardDescription,
              icon: Icons.shopify_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
