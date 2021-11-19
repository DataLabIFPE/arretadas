class ComplaintException implements Exception {
  final String message;

  ComplaintException(this.message);

  @override
  String toString() => 'ComplaintException(message: $message)';
}
