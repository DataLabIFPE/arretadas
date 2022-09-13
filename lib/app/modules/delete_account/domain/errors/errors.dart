class DeleteAccountException implements Exception {
  final String message;

  DeleteAccountException(this.message);

  @override
  String toString() => message;
}
