import 'package:flutter/material.dart';
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
      _homeViewModel?.setCount(1);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Text(
            getLangLocals(context).hello("Suppanat"),
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
              InkWell(
                onTap: () => context.read<HomeViewModel>().changeLangLocal(LangL10n.EN),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: ColorCustom.PRIMARY),
                  child: Text(
                    getLangLocals(context).english,
                    style: const TextStyle(
                        color: ColorCustom.WHITE,
                        fontFamily: FontFamilyCustom.PRIMARY),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => context.read<HomeViewModel>().changeLangLocal(LangL10n.TH),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: ColorCustom.PRIMARY),
                  child: Text(
                    getLangLocals(context).thai,
                    style: const TextStyle(
                        color: ColorCustom.WHITE,
                        fontFamily: FontFamilyCustom.PRIMARY),
                  ),
                ),
              )
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
                    InkWell(
                      onTap: () => context
                          .read<HomeViewModel>()
                          .setCount(context.read<HomeViewModel>().count + 1),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: ColorCustom.GREEN),
                        child: Text(
                          getLangLocals(context).increment,
                          style: const TextStyle(
                              color: ColorCustom.WHITE,
                              fontFamily: FontFamilyCustom.PRIMARY),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () => context
                          .read<HomeViewModel>()
                          .setCount(context.read<HomeViewModel>().count - 1),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: ColorCustom.RED),
                        child: Text(
                          getLangLocals(context).decrement,
                          style: const TextStyle(
                              color: ColorCustom.WHITE,
                              fontFamily: FontFamilyCustom.PRIMARY),
                        ),
                      ),
                    )
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
