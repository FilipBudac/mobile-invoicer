class RequestUnauthorized implements Exception {}
class RuntimeError extends Error {
  String message;

  RuntimeError(this.message);
}