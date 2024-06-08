import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:flutter_provider_boilerplate/core/utils/locator.dart';

abstract class BaseApiService {
  String getBaseUrl({String? endpoint}) {
    switch (endpoint) {
      case EndpointRouteUrl.TEST_API:
        return locator<EnvironmentService>().env?["TEST_URL"] ?? "";
      default:
        return locator<EnvironmentService>().env?["TEST_URL"] ?? "";
    }
  }

  String extractBaseUrl(String input) {
    RegExp regExp = RegExp(r'{(.*?)}/');
    RegExpMatch? match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(1) ?? "";
    }
    return "";
  }

  Future<dynamic> getRequest(String url,
      {Map<String, dynamic>? queryParameters});
  Future<dynamic> postRequest(String url, String body);
  Future<dynamic> putRequest(String url, String body);
  Future<dynamic> deleteRequest(String url,
      {Map<String, dynamic>? queryParameters, String? body});
  Future<dynamic> upload(String url, Map<String, dynamic> body);
}
