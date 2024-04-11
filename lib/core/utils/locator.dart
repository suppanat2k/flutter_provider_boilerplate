import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => GlobalStateService());
}

class GlobalStateService {
  String? _langLocal;
  String? get langLocal => _langLocal;
  void setLangLocal(String? local) {
    _langLocal = local;
  }
}