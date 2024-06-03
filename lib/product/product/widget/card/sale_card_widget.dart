import 'package:flutter/material.dart';

class SaleCardWidget extends StatefulWidget {
  const SaleCardWidget({super.key});

  @override
  State<SaleCardWidget> createState() => _SaleCardWidgetState();
}

class _SaleCardWidgetState extends State<SaleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: const Card(
        child: Center(child: Text('data')),
      ),
    );
  }
}
