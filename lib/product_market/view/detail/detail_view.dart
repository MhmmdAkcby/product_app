import 'package:flutter/material.dart';
import 'package:product_app/product_market/product/mixin/product_lwb_gwb_mixin.dart';

class DetailView extends StatelessWidget with ProductLwbGwbMixin {
  final String? filterText;
  const DetailView({super.key, this.filterText});

  @override
  Widget build(BuildContext context) {
    final String? filterText = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text(filterText!.toUpperCase()),
      ),
      body: viewGridWB(filterText),
    );
  }
}
