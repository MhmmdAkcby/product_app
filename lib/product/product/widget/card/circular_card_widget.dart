import 'package:flutter/material.dart';

class CircularCardWidget extends StatelessWidget {
  const CircularCardWidget({
    super.key,
    required this.text,
  });
  final String text;
  final double _containerSize = 0.11;
  final double _radius = 18;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const _MyEdgeInsets.all(),
      height: MediaQuery.of(context).size.height * _containerSize,
      width: MediaQuery.of(context).size.height * _containerSize,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_radius))),
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}

class _MyEdgeInsets extends EdgeInsets {
  const _MyEdgeInsets.all() : super.all(4);
  const _MyEdgeInsets.bottom() : super.only(bottom: 120);
}
