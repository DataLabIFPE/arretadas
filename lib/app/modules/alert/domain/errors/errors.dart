class AlertException implements Exception {
  final String message;

  AlertException(this.message);

  @override
  String toString() => message;
}
