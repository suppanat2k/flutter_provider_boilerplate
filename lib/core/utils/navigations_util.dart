import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/constants/route.dart';

void openMainLayout(BuildContext context, {bool? isReplacement}) async {
  if (isReplacement == true) {
    Navigator.pushNamedAndRemoveUntil(
        context, RouteConstants.layout, (Route<dynamic> route) => false);
  }
  Navigator.pushNamed(context, RouteConstants.layout);
}

void openHome(BuildContext context) async {
  Navigator.pushNamed(context, RouteConstants.home);
}
