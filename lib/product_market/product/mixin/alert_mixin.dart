import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AlertMixin {
  Future<T?> showAlertMixin<T>({required BuildContext context, required String data, required Widget child}) {
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

  Future<void> showCupertinoMixin(
      {required BuildContext context, required String title, required String message, required Widget child}) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return _CupertinoAlert(title: title, message: message, child: child);
      },
    );
  }
}

class _CupertinoAlert extends StatelessWidget {
  const _CupertinoAlert({
    super.key,
    required this.title,
    required this.message,
    required this.child,
  });
  final String title;
  final String message;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [child],
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
