import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/product_lwb_gwb_mixin.dart';

class DetailView extends StatelessWidget with ProductLwbGwbMixin {
  const DetailView({super.key, required this.filterText});
  final String filterText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(filterText.toUpperCase()),
      ),
      body: viewGridWB(filterText),
    );
  }
}
