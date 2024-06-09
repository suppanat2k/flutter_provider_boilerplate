import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GlobalStateService());
  locator.registerLazySingleton(() => EnvironmentService());
}

class GlobalStateService {
  String? _langLocal;
  String? get langLocal => _langLocal;
  void setLangLocal(String? local) {
    _langLocal = local;
  }
}

class EnvironmentService {
  String? _currentEnvName;
  String? get currentEnvName => _currentEnvName;
  void setCurrentEnvName(String? currentEnvName) {
    _currentEnvName = currentEnvName;
  }

  Map<String, String>? _env;
  Map<String, String>? get env => _env;
  void setEnv(Map<String, String>? env) {
    _env = env;
  }

  void loadDotEnvData(String envName) async {
    setCurrentEnvName(envName);
    Map<String, String> devEnvValue = {};
    Map<String, String> prodEnvValue = {};
    Map<String, String> commonEnvValue = {};
    Map<String, String> currentEnvValue = {};

    dotenv.env.forEach((key, value) {
      if (key.startsWith("DEV_")) {
        devEnvValue = {
          ...devEnvValue,
          key.replaceFirst("DEV_", ""): value,
        };
      } else if (key.startsWith("STG_")) {
        prodEnvValue = {
          ...prodEnvValue,
          key.replaceFirst("STG_", ""): value,
        };
      } else if (key.startsWith("PROD_")) {
        prodEnvValue = {
          ...prodEnvValue,
          key.replaceFirst("PROD_", ""): value,
        };
      } else {
        commonEnvValue = {
          ...commonEnvValue,
          key: value,
        };
      }
    });

    switch (envName) {
      case Environments.DEV:
        currentEnvValue = {
          ...commonEnvValue,
          ...devEnvValue,
        };
        break;
      case Environments.STG:
        currentEnvValue = {
          ...commonEnvValue,
          ...devEnvValue,
        };
        break;
      case Environments.PROD:
        currentEnvValue = {
          ...commonEnvValue,
          ...prodEnvValue,
        };
        break;
    }

    debugPrint("App start in ${envName} mode ..");
    debugPrint("env: ${currentEnvValue}");

    setEnv(currentEnvValue);
  }
}
