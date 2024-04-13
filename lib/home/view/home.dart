import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/core/components/button_custom.dart';
import 'package:flutter_provider_boilerplate/core/constants/enum.dart';
import 'package:flutter_provider_boilerplate/core/functions/main.dart';
import 'package:flutter_provider_boilerplate/core/theme/color.dart';
import 'package:flutter_provider_boilerplate/core/theme/font_family.dart';
import 'package:flutter_provider_boilerplate/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel? _homeViewModel;

  @override
  void initState() {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      //set view model when init state here.
      // _homeViewModel?.setCount(1);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text(
            getLangLocals(context).hello("User"),
            style: const TextStyle(fontFamily: FontFamilyCustom.PRIMARY),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonCustom(
                btnText: getLangLocals(context).english,
                btnOnTap: () =>
                    context.read<HomeViewModel>().changeLangLocal(LangL10n.EN),
              ),
              const SizedBox(
                width: 20,
              ),
              ButtonCustom(
                btnText: getLangLocals(context).thai,
                btnOnTap: () =>
                    context.read<HomeViewModel>().changeLangLocal(LangL10n.TH),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Text(
                    context.watch<HomeViewModel>().count.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamilyCustom.PRIMARY),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    getLangLocals(context).countWarning,
                    style:
                        const TextStyle(fontFamily: FontFamilyCustom.PRIMARY),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonCustom(
                      btnText: getLangLocals(context).increment,
                      btnOnTap: () => context
                          .read<HomeViewModel>()
                          .setCount(context.read<HomeViewModel>().count + 1),
                      btnColor: ColorCustom.GREEN,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonCustom(
                      btnText: getLangLocals(context).decrement,
                      btnOnTap: () => context
                          .read<HomeViewModel>()
                          .setCount(context.read<HomeViewModel>().count - 1),
                      btnColor: ColorCustom.RED,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
