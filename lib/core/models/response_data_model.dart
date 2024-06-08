import 'package:http/http.dart' as http;

///This is generic response data model please modify it according to your API Structure.
///Model is designed to be generic please keep it that way
///Things to change:
///              1. Change data section - key where your data is.
///              2. Error and Messages -  key where your error, errors and message are.
///              3. okAndContainsData Condition - Change logic according to your API Structure
class ResponseData {
  int? statusCode;
  bool? ok;
  bool? okAndContainsData;
  var data;
  var message;
  ResponseErrors? errors;
  String? rawResponseBody;

  ResponseData(
      {this.statusCode, this.data, this.message, this.errors, this.ok = false, this.okAndContainsData = false, this.rawResponseBody});

  factory ResponseData.fromResponse(http.Response response) {
    return ResponseData(
      statusCode: response.statusCode,
      ok: (response.statusCode == 200 || response.statusCode == 201),
      data: response.body,
      rawResponseBody: response.body,
      okAndContainsData: (response.statusCode == 200 || response.statusCode == 201),
    );
  }
}

class ResponseErrors {
  String message;

  ResponseErrors({
    required this.message,
  });

  factory ResponseErrors.fromJson(Map<String, dynamic> parsedJson) {
    return ResponseErrors(
      message: parsedJson['message'] ?? "",
    );
  }
}
