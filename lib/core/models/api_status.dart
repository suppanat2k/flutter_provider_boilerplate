class Success {
  int? code;
  String? message;
  Object? response;
  int? totalItems;
  Success({this.code, this.message, this.response, this.totalItems});
  Success copyWith({
    int? code,
    String? message,
    Object? response,
    int? totalItems,
  }) {
    return Success(
      code: code ?? this.code,
      message: message ?? this.message,
      response: response ?? this.response,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

class Failure {
  int? statusCode;
  String? message;
  String? error;
  int? code;
  String? errResponse;
  Failure({
    this.statusCode,
    this.message,
    this.error,
    this.code,
    this.errResponse,
  });
  Failure copyWith({
    int? statusCode,
    String? message,
    String? error,
    int? code,
    String? errResponse,
  }) {
    return Failure(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      error: error ?? this.error,
      code: code ?? this.code,
      errResponse: errResponse ?? this.errResponse,
    );
  }
}
