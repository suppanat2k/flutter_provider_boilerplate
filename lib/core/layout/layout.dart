import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/page/home/view/home.dart';
import 'package:flutter_provider_boilerplate/page/next_page/view/nextPage.dart';

class MainLayout extends StatefulWidget {
  final int? index;
  const MainLayout({super.key, this.index});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List page = [const Home(), const NextPage()];

  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: page[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
