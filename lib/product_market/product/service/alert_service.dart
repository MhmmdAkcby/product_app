import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';

class AlertService {
  final GetIt _getIt = GetIt.instance;

  late NavigationService _navigationService;

  AlertService() {
    _navigationService = _getIt.get<NavigationService>();
  }
  void showToast({required String text, IconData icon = Icons.info, Color iconColor = Colors.white}) {
    try {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.bottom,
        builder: (context) {
          return ToastCard(
            leading: Icon(
              icon,
              size: _WidgetSizes().iconSize,
              color: iconColor,
            ),
            title: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: _WidgetSizes().fontSize,
                  ),
            ),
          );
        },
      ).show(_navigationService.navigatorKey.currentContext!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class _WidgetSizes {
  final double iconSize = 28;
  final double fontSize = 14;
}
