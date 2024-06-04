import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/product/cubit/product_cubit.dart';
import 'package:product_app/product/cubit/product_cubit_state.dart';
import 'package:product_app/product/model/product_model.dart';
import 'package:product_app/product/product/constant/color/project_color.dart';
import 'package:product_app/product/product/widget/card/circular_card_widget.dart';
import 'package:product_app/product/product/widget/draw_widget/naw_drawer_widget.dart';

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
    return const Scaffold(
      body: Column(
        children: [
          _ProductCategory(),
          InfoProducListCardText(),
          _ProdoctBeautyList(),
          Expanded(flex: 6, child: Text('data')),
        ],
      ),
    );
  }
}

class InfoProducListCardText extends StatelessWidget {
  const InfoProducListCardText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Beauty',
              style: textTheme(context, ProjectColor.darkColor(), 30, FontWeight.bold),
            ),
            TextButton(onPressed: () {}, child: const Text('See all'))
          ],
        ),
      ),
    );
  }
}
