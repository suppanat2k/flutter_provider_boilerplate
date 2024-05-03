import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider_boilerplate/core/components/cardItem.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 142,
            child: SingleChildScrollView(
              physics: FixedExtentScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4),
              scrollDirection: Axis.horizontal,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => CardItem(),)
            ),
          )
        ],
      ),
    );
  }
}
