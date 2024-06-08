

abstract class BaseApiService {
  String getBaseUrl({String? endpoint}) {
    switch (endpoint) {
      // case EndpointRouteUrl.PROMPTCARE_API_URL:
      //   return locator<EnvironmentService>().env?["PROMPTCARE_API_URL"] ?? "";
      // case EndpointRouteUrl.THB_API_URL:
      //   return locator<EnvironmentService>().env?["THB_API_URL"] ?? "";
      // case EndpointRouteUrl.DATA_MANAGE_API_URL:
      //   return locator<EnvironmentService>().env?["DATA_MANAGE_API_URL"] ?? "";
      // case EndpointRouteUrl.KIOSK_API_URL:
      //   return locator<EnvironmentService>().env?["KIOSK_API_URL"] ?? "";
      // default:
      //   return locator<EnvironmentService>().env?["THB_API_URL"] ?? "";
    }
    return "";
  }

  String extractBaseUrl(String input) {
    RegExp regExp = RegExp(r'{(.*?)}/');
    RegExpMatch? match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(1) ?? "";
    }
    return "";
  }

  Future<dynamic> getRequest(String url, {Map<String, dynamic>? queryParameters});
  Future<dynamic> postRequest(String url, String body);
  Future<dynamic> putRequest(String url, String body);
  Future<dynamic> deleteRequest(String url, {Map<String, dynamic>? queryParameters, String? body});
  Future<dynamic> upload(String url, Map<String, dynamic> body);
}
