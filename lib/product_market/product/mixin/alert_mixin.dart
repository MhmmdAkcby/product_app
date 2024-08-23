import 'package:flutter/material.dart';

mixin AlertMixin {
  Future<T?> showAlertMixin<T>(BuildContext context, String data, Widget child) {
    return showDialog(
      context: context,
      builder: (context) {
        return _AlertWidget(
          data: data,
          child: child,
        );
      },
    );
  }
}

class _AlertWidget extends StatelessWidget {
  const _AlertWidget({
    super.key,
    required this.data,
    required this.child,
  });
  final String data;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(data),
      actions: [child],
    );
  }
}
