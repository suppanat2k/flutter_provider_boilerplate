import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';

void openMainLayout(BuildContext context, {bool? isReplacement}) async {
  if (isReplacement == true) {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteConstants.home, (Route<dynamic> route) => false);
  }
  Navigator.pushNamed(context, RouteConstants.home);
}

