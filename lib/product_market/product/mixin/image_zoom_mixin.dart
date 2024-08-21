import 'package:flutter/material.dart';

mixin ImageZoomMixin {
  Future<T?> imageZoom<T>(BuildContext context, String url) {
    return showDialog(
      context: context,
      builder: (context) {
        return ImageZoom(url: url);
      },
    );
  }
}

class ImageZoom extends StatelessWidget {
  const ImageZoom({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: InteractiveViewer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: _WidgetSize().sizedBoxHeight,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * _WidgetSize().imageNetworkHeight,
          ),
        ),
      ),
    );
  }
}

class _WidgetSize {
  final double sizedBoxHeight = 400;
  final double imageNetworkHeight = 0.6;
}
