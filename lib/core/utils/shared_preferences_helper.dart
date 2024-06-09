// ignore_for_file: constant_identifier_names

import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Common shared preference helper class
class SharedPreferencesHelper {
  static const String ACTIVATE_KEY = "ACTIVATE_KEY";

  static Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  static Future<String?> getLangLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferencesName.LANG_LOCAL);
  }

  static Future<bool> setLangLocal(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPreferencesName.LANG_LOCAL, value);
  }

  static Future<bool> clearLangLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(SharedPreferencesName.LANG_LOCAL);
  }

  // static Future<Credential?> getCredential() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? credential = prefs.getString(SharedPreferencesName.CREDENTIAL);
  //   if (credential != null) {
  //     dynamic credentialDecode =
  //         json.decode(prefs.getString(SharedPreferencesName.CREDENTIAL) ?? "");
  //     List<dynamic>? scopes = credentialDecode['scopes'];
  //     List<Scope>? listScopes = scopes?.map((e) {
  //       return Scope.fromJson(json.decode(e));
  //     }).toList();
  //     return Credential(
  //       scopes: listScopes,
  //       accessToken: credentialDecode['accessToken'],
  //       refreshToken: credentialDecode['refreshToken'],
  //     );
  //   }
  //   return null;
  // }

  // static Future<bool> setCredential(Credential value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var jsonBody = value.toJson();
  //   return prefs.setString(SharedPreferencesName.CREDENTIAL, jsonBody);
  // }
}
