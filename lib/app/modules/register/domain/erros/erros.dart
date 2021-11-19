class RegisterException implements Exception {
  final String message;

  RegisterException(this.message);

  @override
  String toString() => 'RegisterException(message: $message)';
}
