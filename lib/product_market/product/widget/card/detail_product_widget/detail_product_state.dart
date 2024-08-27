import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:product_app/product_market/product/utils/navigator/navigator_service.dart';
import 'package:product_app/product_market/product/service/alert_service.dart';
import 'package:product_app/product_market/product/utils/color/project_color.dart';
import 'package:product_app/product_market/product/widget/card/detail_product_widget/details_prdocut_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class DetailProductState<T extends DetailsProductWidget> extends State<T> {
  final GetIt _getIt = GetIt.instance;

  late AlertService alertService;
  late NavigationService navigatorService;

  @override
  void initState() {
    super.initState();
    navigatorService = _getIt<NavigationService>();
    alertService = _getIt<AlertService>();
  }

  void alertMessage() {
    var d = AppLocalizations.of(context);
    alertService.showToast(
      text: d!.alertInfo,
      icon: Icons.check,
      iconColor: ProjectColor.greenColor(),
    );
  }
}
