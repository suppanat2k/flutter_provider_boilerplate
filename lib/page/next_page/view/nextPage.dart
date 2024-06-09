import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/components/button_custom.dart';
import 'package:flutter_provider_boilerplate/core/functions/main.dart';
import 'package:flutter_provider_boilerplate/core/layout/layout.dart';
import 'package:flutter_provider_boilerplate/core/theme/color.dart';
import 'package:flutter_provider_boilerplate/page/home/view/home.dart';
import 'package:flutter_provider_boilerplate/page/home/view_model/home_view_model.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _HomeState();
}

class _HomeState extends State<NextPage> {
  HomeViewModel? _homeViewModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ButtonCustom(
      btnColor: ColorCustom.RED,
      btnText: getLangLocals(context).backToHome,
      btnOnTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainLayout(index: 0)),
      ),
    ));
  }
}
