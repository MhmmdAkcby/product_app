import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/cubit/product_cubit.dart';
import 'package:product_app/product_market/model/product_model.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/widget/view_builder_card/product_lwb_widget.dart';

part 'search.g.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _searchBar(context),
          if (query.isNotEmpty) _searchData(),
        ],
      ),
    );
  }

  Widget _searchData() {
    return Expanded(
      child: ListView.builder(
        itemCount: context.read<ProductCubit>().state.filterProducts?.length,
        itemBuilder: (context, index) {
          final product = context.read<ProductCubit>().state.filterProducts?[index];
          return _lisTileCard(product);
        },
      ),
    );
  }

  Widget _lisTileCard(Products? product) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductLwbWidget(filterId: product?.id ?? 0),
            ));
      },
      child: _showProductList(product),
    );
  }

  Widget _showProductList(Products? product) {
    return ListTile(
      title: Text(product?.title ?? ''),
      trailing: Image.network(
        product?.images?.first ?? '',
        height: _WidgetSize().imagesize,
        width: _WidgetSize().imagesize,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Container(
      padding: const _WidgetPaddingAndMargin.symmetricHorizontal(),
      margin: const _WidgetPaddingAndMargin.symetricMargin(),
      decoration: _searchDecoration(),
      child: TextField(
        onChanged: (value) {
          _searchMethod(value, context);
        },
        decoration: _searchInputDecoration(d),
      ),
    );
  }

  void _searchMethod(String value, BuildContext context) {
    setState(() {
      query = value;
    });
    context.read<ProductCubit>().searchProducts(value);
  }
}
