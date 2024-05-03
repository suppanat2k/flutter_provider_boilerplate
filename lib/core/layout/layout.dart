import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.menu),
                    ),
                    Container(
                      child: Text("Thirawit Poonpattanasub (POS : 1 กะ : 2)"),
                    ),
                  ],
                ),
              ),
              Container(
                child: Image.asset("assets/icons/abfefb61573478ff8bf37a2830e73c5a.png",scale: 8,),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Text("1"),
                    ),
                    Container(
                      child: Text("1"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
