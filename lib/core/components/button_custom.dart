import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/theme/color.dart';
import 'package:flutter_provider_boilerplate/core/theme/font_family.dart';

class ButtonCustom extends StatelessWidget {
  final String? btnText;
  final Color? btnColor;
  final Color? btnTextColor;
  final Function()? btnOnTap;
  const ButtonCustom({super.key, this.btnText, this.btnColor, this.btnOnTap, this.btnTextColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnOnTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: btnColor ?? ColorCustom.PRIMARY),
        child: Text(
          btnText ?? "Button",
          style: TextStyle(
              color: btnTextColor ?? ColorCustom.WHITE, fontFamily: FontFamilyCustom.PRIMARY),
        ),
      ),
    );
  }
}
