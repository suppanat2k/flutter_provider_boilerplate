// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void runServer() async {
  final ipv4 = InternetAddress.anyIPv4 ==
          InternetAddress('0.0.0.0', type: InternetAddressType.IPv4)
      ? InternetAddress.loopbackIPv4
      : InternetAddress.anyIPv4; //change host here
  const port = 5000; //change port here
  final server = await HttpServer.bind(ipv4, port);
  print('Server ${server.address} running on port ${server.port}');

  await for (var request in server) {
    if (request.method == 'GET') {
      if (request.uri.path == '/api/data') {
        handleGet(request);
      } else {
        request.response.statusCode = HttpStatus.methodNotAllowed;
        request.response.write('Unsupported request method: ${request.method}');
        await request.response.close();
      }
    } else if (request.method == 'POST') {
      if (request.uri.path == '/api/create') {
        handlePost(request);
      } else {
        request.response.statusCode = HttpStatus.methodNotAllowed;
        request.response.write('Unsupported request method: ${request.method}');
        await request.response.close();
      }
    } else if (request.method == 'PUT') {
      if (request.uri.path == '/api/update') {
        handlePut(request);
      } else {
        request.response.statusCode = HttpStatus.methodNotAllowed;
        request.response.write('Unsupported request method: ${request.method}');
        await request.response.close();
      }
    } else if (request.method == 'DELETE') {
      if (request.uri.path == '/api/delete') {
        handleDelete(request);
      } else {
        request.response.statusCode = HttpStatus.methodNotAllowed;
        request.response.write('Unsupported request method: ${request.method}');
        await request.response.close();
      }
    } else {
      request.response.statusCode = HttpStatus.methodNotAllowed;
      request.response.write('Unsupported request method: ${request.method}');
      await request.response.close();
    }
  }
}

void handleGet(HttpRequest request) async {
  request.response.headers.contentType = ContentType.json;
  var jsonData = {'data': [], 'message': 'Get data success'};
  request.response.write(jsonData);
  await request.response.close();
}

void handlePost(HttpRequest request) async {
  var jsonString = await utf8.decodeStream(request);
  var jsonData = jsonDecode(jsonString);
  jsonData['message'] = "Create data success";
  print(jsonData);

  request.response.headers.contentType = ContentType.text;
  request.response.write(jsonData);
  await request.response.close();
}

void handlePut(HttpRequest request) async {
  var jsonString = await utf8.decodeStream(request);
  var jsonData = jsonDecode(jsonString);
  jsonData['message'] = "Update data success";
  print(jsonData);

  request.response.headers.contentType = ContentType.text;
  request.response.write('PUT request received with data: $jsonData');
  await request.response.close();
}

void handleDelete(HttpRequest request) async {
  var jsonString = await utf8.decodeStream(request);
  var jsonData = jsonDecode(jsonString);
  jsonData['message'] = "Delete data id ${jsonData['data']['id']} success";
  print(jsonData);

  request.response.headers.contentType = ContentType.text;
  request.response.write(jsonData);
  await request.response.close();
}
