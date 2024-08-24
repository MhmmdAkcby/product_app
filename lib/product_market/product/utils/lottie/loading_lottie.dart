import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:product_app/product_market/product/utils/image_path.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key});

  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Lottie.asset(ImagePath.lottieLoadPath.toImage())),
          Text(d!.loading),
        ],
      ),
    );
  }
}
