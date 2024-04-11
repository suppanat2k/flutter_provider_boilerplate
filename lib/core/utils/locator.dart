import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GlobalStateService());
}

class GlobalStateService {
  Locale? _locale;
  Locale get locale => _locale ?? const Locale('en');
  void setLocale(Locale locale) {
    _locale = locale;
  }
}