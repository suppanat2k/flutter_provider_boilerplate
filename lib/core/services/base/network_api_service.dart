// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_provider_boilerplate/core/utils/locator.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// import 'app_exception.dart';
// import 'base_api_service.dart';

// class NetworkApiService extends BaseApiService {
//   static Future<Map<String, String>> _getHeaders() async {
//     Map<String, String> map = {
//       //Add or Remove headers from here
//       'Content-Type': 'application/json',
//       'lang': locator<GlobalStateService>().langLocal?.toLowerCase() ?? 'en',
//       // 'Authorization': 'Bearer '
//     };

//     String? accessToken = locator<GlobalStateService>().credential?.accessToken;

//     if (accessToken != null) {
//       map["Authorization"] = "Bearer $accessToken";
//     }

//     return map;
//   }

//   @override
//   Future getRequest(String url, {Map<String, dynamic>? queryParameters}) async {
//     dynamic responseJson;
//     String queryString = Uri(queryParameters: queryParameters).query;

//     //set endpoint
//     String endpointBaseUrl = extractBaseUrl(url);
//     String baseUrl = getBaseUrl(endpoint: endpointBaseUrl);
//     url = url.replaceFirst("{$endpointBaseUrl}/", "");

//     var requestUrl = baseUrl + url;
//     if (queryString.isNotEmpty) {
//       requestUrl = '$baseUrl$url?$queryString';
//     }

//     BuildContext? context =
//         locator<NavigationService>().navigatorKey.currentContext;
//     try {
//       PublicSignatureModel? signature = generateHashSignature(
//           url: queryString.isNotEmpty ? '$url?$queryString' : url, data: "");

//       Response response = await http.get(
//         Uri.parse(requestUrl),
//         headers: {
//           ...await _getHeaders(),
//           'public_key': signature.publicKey ?? "",
//           'signature': signature.signature ?? "",
//           'nonce': signature.nonce ?? "",
//         },
//       );

//       //refreshToken
//       if (response.statusCode == 401) {
//         Credential? credential = await SharedPreferencesHelper.getCredential();

//         if (credential?.refreshToken != null) {
//           bool refreshTokenSuccess =
//               await refreshToken(refreshToken: credential!.refreshToken!);
//           if (refreshTokenSuccess) {
//             //call api again
//             response = await http.get(
//               Uri.parse(requestUrl),
//               headers: {
//                 ...await _getHeaders(),
//                 'public_key': signature.publicKey ?? "",
//                 'signature': signature.signature ?? "",
//                 'nonce': signature.nonce ?? "",
//               },
//             );
//           } else {
//             if (context != null) {
//               if (context.mounted &&
//                   LoadingOverlay.of(context).isShowDialog()) {
//                 LoadingOverlay.of(context).hide();
//               }
//             }
//             logout();
//           }
//         }
//       }

//       responseJson = returnResponse(response);
//     } on SocketException {
//       BuildContext? context =
//           locator<NavigationService>().navigatorKey.currentContext;
//       if (context != null) {
//         throw FetchDataException(getLangLocals(context).noInternetConnection);
//       } else {
//         throw FetchDataException('No Internet Connection');
//       }
//     }
//     return responseJson;
//   }

//   @override
//   Future postRequest(String url, String body) async {
//     dynamic responseJson;

//     //set endpoint
//     String endpointBaseUrl = extractBaseUrl(url);
//     String baseUrl = getBaseUrl(endpoint: endpointBaseUrl);
//     url = url.replaceFirst("{$endpointBaseUrl}/", "");

//     try {
//       PublicSignatureModel? signature =
//           generateHashSignature(url: url, data: body);

//       Response response = await http.post(
//         Uri.parse(baseUrl + url),
//         body: body,
//         headers: {
//           ...await _getHeaders(),
//           'public_key': signature.publicKey ?? "",
//           'signature': signature.signature ?? "",
//           'nonce': signature.nonce ?? "",
//         },
//       );

//       //refreshToken
//       if (response.statusCode == 401) {
//         Credential? credential = await SharedPreferencesHelper.getCredential();

//         if (credential?.refreshToken != null) {
//           bool refreshTokenSuccess =
//               await refreshToken(refreshToken: credential!.refreshToken!);
//           if (refreshTokenSuccess) {
//             //call api again
//             response = await http.post(
//               Uri.parse(baseUrl + url),
//               body: body,
//               headers: {
//                 ...await _getHeaders(),
//                 'public_key': signature.publicKey ?? "",
//                 'signature': signature.signature ?? "",
//                 'nonce': signature.nonce ?? "",
//               },
//             );
//           } else {
//             // logout();
//           }
//         }
//       }

//       responseJson = returnResponse(response);
//     } on SocketException {
//       BuildContext? context =
//           locator<NavigationService>().navigatorKey.currentContext;
//       if (context != null) {
//         throw FetchDataException(getLangLocals(context).noInternetConnection);
//       } else {
//         throw FetchDataException('No Internet Connection');
//       }
//     }
//     return responseJson;
//   }

//   @override
//   Future putRequest(String url, String body) async {
//     dynamic responseJson;

//     //set endpoint
//     String endpointBaseUrl = extractBaseUrl(url);
//     String baseUrl = getBaseUrl(endpoint: endpointBaseUrl);
//     url = url.replaceFirst("{$endpointBaseUrl}/", "");

//     try {
//       PublicSignatureModel? signature =
//           generateHashSignature(url: url, data: body);

//       Response response = await http.put(
//         Uri.parse(baseUrl + url),
//         body: body,
//         headers: {
//           ...await _getHeaders(),
//           'public_key': signature.publicKey ?? "",
//           'signature': signature.signature ?? "",
//           'nonce': signature.nonce ?? "",
//         },
//       );

//       //refreshToken
//       if (response.statusCode == 401) {
//         Credential? credential = await SharedPreferencesHelper.getCredential();

//         if (credential?.refreshToken != null) {
//           bool refreshTokenSuccess =
//               await refreshToken(refreshToken: credential!.refreshToken!);
//           if (refreshTokenSuccess) {
//             //call api again
//             response = await http.put(
//               Uri.parse(baseUrl + url),
//               body: body,
//               headers: {
//                 ...await _getHeaders(),
//                 'public_key': signature.publicKey ?? "",
//                 'signature': signature.signature ?? "",
//                 'nonce': signature.nonce ?? "",
//               },
//             );
//           } else {
//             // logout();
//           }
//         }
//       }

//       responseJson = returnResponse(response);
//     } on SocketException {
//       BuildContext? context =
//           locator<NavigationService>().navigatorKey.currentContext;
//       if (context != null) {
//         throw FetchDataException(getLangLocals(context).noInternetConnection);
//       } else {
//         throw FetchDataException('No Internet Connection');
//       }
//     }
//     return responseJson;
//   }

//   @override
//   Future deleteRequest(
//     String url, {
//     Map<String, dynamic>? queryParameters,
//     String? body,
//   }) async {
//     dynamic responseJson;
//     String queryString = Uri(queryParameters: queryParameters).query;

//     //set endpoint
//     String endpointBaseUrl = extractBaseUrl(url);
//     String baseUrl = getBaseUrl(endpoint: endpointBaseUrl);
//     url = url.replaceFirst("{$endpointBaseUrl}/", "");

//     var requestUrl = baseUrl + url;
//     if (queryString.isNotEmpty) {
//       requestUrl = '$baseUrl$url?$queryString';
//     }
//     try {
//       PublicSignatureModel? signature = generateHashSignature(
//           url: queryString.isNotEmpty ? '$url?$queryString' : url,
//           data: body ?? "");

//       Response response = await http.delete(
//         Uri.parse(requestUrl),
//         body: body,
//         headers: {
//           ...await _getHeaders(),
//           'public_key': signature.publicKey ?? "",
//           'signature': signature.signature ?? "",
//           'nonce': signature.nonce ?? "",
//         },
//       );

//       //refreshToken
//       if (response.statusCode == 401) {
//         Credential? credential = await SharedPreferencesHelper.getCredential();

//         if (credential?.refreshToken != null) {
//           bool refreshTokenSuccess =
//               await refreshToken(refreshToken: credential!.refreshToken!);
//           if (refreshTokenSuccess) {
//             //call api again
//             response = await http.delete(
//               Uri.parse(requestUrl),
//               body: body,
//               headers: {
//                 ...await _getHeaders(),
//                 'public_key': signature.publicKey ?? "",
//                 'signature': signature.signature ?? "",
//                 'nonce': signature.nonce ?? "",
//               },
//             );
//           } else {
//             // logout();
//           }
//         }
//       }

//       responseJson = returnResponse(response);
//     } on SocketException {
//       BuildContext? context =
//           locator<NavigationService>().navigatorKey.currentContext;
//       if (context != null) {
//         throw FetchDataException(getLangLocals(context).noInternetConnection);
//       } else {
//         throw FetchDataException('No Internet Connection');
//       }
//     }
//     return responseJson;
//   }

//   @override
//   Future upload(String url, Map<String, dynamic> body) async {
//     dynamic responseJson;

//     //set endpoint
//     String endpointBaseUrl = extractBaseUrl(url);
//     String baseUrl = getBaseUrl(endpoint: endpointBaseUrl);
//     url = url.replaceFirst("{$endpointBaseUrl}/", "");

//     try {
//       http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(baseUrl + url))
//         ..headers.addAll(await _getHeaders());

//       body.forEach((key, value) {
//         if (value != null) {
//           if (value is List<MultipartFile>) {
//             request.files.addAll(value);
//           } else if (value is MultipartFile) {
//             request.files.add(value);
//           } else if (value is List) {
//             for (var i = 0; i < value.length; i++) {
//               request.fields['$key[$i]'] = "${value[i]}";
//             }
//           } else {
//             request.fields[key] = "$value";
//           }
//         }
//       });

//       Map<String, String> fields = {
//         ...request.fields,
//       };
//       fields.removeWhere((key, value) => value.isEmpty);

//       PublicSignatureModel? signature =
//           generateHashSignature(url: url, data: json.encode(fields));

//       request.headers.addAll({
//         'public_key': signature.publicKey ?? "",
//         'signature': signature.signature ?? "",
//         'nonce': signature.nonce ?? "",
//         'form_fields': utf8.fuse(base64Url).encode(json.encode(fields)),
//       });

//       StreamedResponse streamedResponse = await request.send();
//       Response response = await http.Response.fromStream(streamedResponse);

//       //refreshToken
//       if (response.statusCode == 401) {
//         Credential? credential = await SharedPreferencesHelper.getCredential();

//         if (credential?.refreshToken != null) {
//           bool refreshTokenSuccess =
//               await refreshToken(refreshToken: credential!.refreshToken!);
//           if (refreshTokenSuccess) {
//             //call api again
//             streamedResponse = await request.send();
//             response = await http.Response.fromStream(streamedResponse);
//           } else {
//             // logout();
//           }
//         }
//       }

//       responseJson = returnResponse(response);
//     } on SocketException {
//       BuildContext? context =
//           locator<NavigationService>().navigatorKey.currentContext;
//       if (context != null) {
//         throw FetchDataException(getLangLocals(context).noInternetConnection);
//       } else {
//         throw FetchDataException('No Internet Connection');
//       }
//     }
//     return responseJson;
//   }

//   dynamic returnResponse(http.Response response) async {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         dynamic responseBody = response.body;
//         return responseBody;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 401:
//         throw UnauthorisedException(response.body.toString());
//       case 403:
//         String? accessToken =
//             locator<GlobalStateService>().credential?.accessToken;
//         if (accessToken != null) {
//           logout(
//             redirectLogin: locator<NavigationService>().currentRouteName() !=
//                 RouteConstants.home,
//           );
//         }
//         throw UnauthorisedException(response.body.toString());
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(response.body.toString());
//     }
//   }
// }
