import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:flutter_provider_boilerplate/core/constants/route.dart';
import 'package:flutter_provider_boilerplate/core/layout/layout.dart';
import 'package:flutter_provider_boilerplate/core/utils/locator.dart';
import 'package:flutter_provider_boilerplate/home/view/home.dart';
import 'package:flutter_provider_boilerplate/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            locale: Locale.fromSubtags(
                languageCode: locator<GlobalStateService>().langLocal ?? LangL10n.EN),
            initialRoute: RouteConstants.home,
            routes: {
              RouteConstants.home:(context) => const MainLayout()
            },
          ));
  }
}
