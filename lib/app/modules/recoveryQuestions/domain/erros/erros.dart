class RecoveryQuestionsException implements Exception {
  final String message;

  RecoveryQuestionsException(this.message);

  @override
  String toString() => 'RecoveryQuestionsException(message: $message)';
}
