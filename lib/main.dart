import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:flutter_provider_boilerplate/core/functions/main.dart';
import 'package:flutter_provider_boilerplate/core/utils/locator.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    locator<GlobalStateService>().setLocale(const Locale(LangL10n.TH));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        locale: locator<GlobalStateService>().locale,
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(getLangLocals(context).helloWorld),
      ),
    );
  }
}
