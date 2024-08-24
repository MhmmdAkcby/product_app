enum ImagePath { lottieLoadPath }

extension ImagePathExtension on ImagePath {
  String toImage() {
    switch (this) {
      case ImagePath.lottieLoadPath:
        return 'assets/lottie/load.json';
    }
  }
}
