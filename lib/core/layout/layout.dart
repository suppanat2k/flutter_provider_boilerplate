import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_boilerplate/core/theme/color.dart';
import 'package:flutter_provider_boilerplate/home/view/home.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final screen = [const Home()];
  final pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1,color: ColorCustom.BORDER))),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: const Icon(Icons.menu),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        child: const Text(
                            "Thirawit Poonpattanasub (POS : 1 กะ : 2)"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    "assets/icons/abfefb61573478ff8bf37a2830e73c5a.png",
                    width: 54,
                    height: 24,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: const Text("01/01/2567 09:41"),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        child: const Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: screen[pageIndex]),
        ]),
      ),
    );
  }
}
