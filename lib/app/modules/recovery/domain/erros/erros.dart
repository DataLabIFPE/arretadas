class RecoveryQuestionsException implements Exception {
  final String message;

  RecoveryQuestionsException(this.message);

  @override
  String toString() => 'RecoveryQuestionsException(message: $message)';
}

class RecoveryPasswordException implements Exception {
  final String message;

  RecoveryPasswordException(this.message);

  @override
  String toString() => 'RecoveryPasswordException(message: $message)';
}
