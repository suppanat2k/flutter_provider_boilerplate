import 'dart:convert';

ErrorModel postErrorFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String postErrorToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  int? statusCode;
  String? message;
  String? error;
  int? code;
  ErrorModel({
    this.statusCode,
    this.message,
    this.error,
    this.code,
  });

  ErrorModel copyWith({
    int? statusCode,
    String? message,
    String? error,
    int? code,
  }) {
    return ErrorModel(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      error: error ?? this.error,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'statusCode': statusCode,
      'message': message,
      'error': error,
      'code': code,
    };
  }

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      statusCode: map['statusCode']?.toInt() ?? 0,
      message: map['message'] ?? '',
      error: map['error'] ?? '',
      code: map['code']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromJson(String source) {
    ErrorModel errModel;
    try {
      errModel = ErrorModel.fromMap(json.decode(source));
    } on FormatException catch (e) {
      errModel = ErrorModel(message: e.message, statusCode: 0, error: '', code: 0);
    }
    return errModel;
  }

  @override
  String toString() => 'ErrorModel(statusCode: $statusCode, message: $message, code: $code)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorModel &&
        other.statusCode == statusCode &&
        other.message == message &&
        other.error == error &&
        other.code == code;
  }

  @override
  int get hashCode => statusCode.hashCode ^ message.hashCode;
}
