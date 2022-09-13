class ChangePasswordException implements Exception {
  final String message;

  ChangePasswordException(this.message);

  @override
  String toString() => message;
}
