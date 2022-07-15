class SplashException implements Exception {
  final String message;

  SplashException(this.message);

  @override
  String toString() {
    return message;
  }
}
