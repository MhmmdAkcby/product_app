enum ImagePath { lottieLoadPath, loginLottie }

extension ImagePathExtension on ImagePath {
  String toImage() {
    switch (this) {
      case ImagePath.lottieLoadPath:
        return 'assets/lottie/load.json';
      case ImagePath.loginLottie:
        return 'assets/lottie/login.json';
    }
  }
}
