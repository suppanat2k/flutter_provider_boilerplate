import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/utils/locator.dart';

class HomeViewModel extends ChangeNotifier {
  //#region variable
  int _count = 0;
  int get count => _count;
  //#endregion variable

  //#region logic
  void setCount(int number, {bool? notify}) {
    if (number < 0) return;
    _count = number;

    if (notify != false) {
      notifyListeners();
    }
  }

  void changeLangLocal(String local) async {
    locator<GlobalStateService>().setLangLocal(local);
    await WidgetsBinding.instance.performReassemble(); //re render all UI
    notifyListeners();
  }
  //#endregion logic
}
