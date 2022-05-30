class InvalidCredential implements Exception {
  final String failedValue;

  InvalidCredential({required this.failedValue});
}
