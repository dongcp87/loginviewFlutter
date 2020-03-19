enum ResponseStatus {
  success,
  ng,
  systemErr,
  sessionErr,
  connectionErr,
  dataErr,
  serrverErr,
  httpErr
}

class APIResponse<T> {
  final ResponseStatus status;
  final String message;
  final T data;
  APIResponse(this.status, this.message, this.data);
}