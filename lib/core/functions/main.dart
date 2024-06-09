//global functions here

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:flutter_provider_boilerplate/core/models/public_signature_model.dart';
import 'package:flutter_provider_boilerplate/core/services/network_api_service.dart';
import 'package:flutter_provider_boilerplate/core/utils/locator.dart';
import 'package:uuid/uuid.dart';

PublicSignatureModel generateHashSignature({
  required String url,
  required String data,
}) {
  var uuid = const Uuid();
  String privateKey =
      locator<EnvironmentService>().env?["PRIVATE_SECRET_KEY"] ?? "";
  String publicKey =
      locator<EnvironmentService>().env?["PUBLIC_SECRET_KEY"] ?? "";

  //set endpoint
  String endpointBaseUrl = NetworkApiService().extractBaseUrl(url);
  String baseUrl = NetworkApiService().getBaseUrl(endpoint: endpointBaseUrl);
  url = url.replaceFirst("{$endpointBaseUrl}/", "");

  String nonce = uuid.v4();

  //signature
  String rawData =
      "/${url.replaceFirst(baseUrl, "")}.${data.isEmpty ? "{}" : data}.$nonce";
  Hmac hmacSha256 = Hmac(sha256, utf8.encode(privateKey));
  String signature = hmacSha256.convert(utf8.encode(rawData)).toString();

  return PublicSignatureModel(
    publicKey: publicKey,
    signature: signature,
    nonce: nonce,
  );
}

Future<String> getCurrentEnvironmentName() async {
  const envMode = String.fromEnvironment('ENV_MODE');
  String env = envMode == Environments.DEV ? Environments.DEV : Environments.PROD;
  if (env == 'dev') return Environments.DEV;
  return Environments.PROD;
}

L10n getLangLocals(BuildContext context) {
  return L10n.of(context)!;
}
