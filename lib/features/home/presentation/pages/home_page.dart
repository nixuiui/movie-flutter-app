import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedIndex = 0;

  final _parentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void selectIndex(int selectedIndex) {
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  Widget _bodyOptions() {
    switch(selectedIndex) {
      case 0:
        return const HomeTab();
      case 1:
        return const Text('ss');
      case 2:
        return const Text('ss');
      default:
        return const Text('Product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _parentKey,
      body: Stack(
        children: [
          _bodyOptions(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedLabelStyle: const TextStyle(
          color: Color(0xffc2c3c2),
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.24,
          height: 1.4,
        ),
        selectedLabelStyle: TextStyle(
          color: NxColor.primary,
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.24,
          height: 1.4,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_rounded),
            activeIcon: Icon(Icons.receipt_rounded),
            label: 'Orderan',
          ),
          BottomNavigationBarItem(
            icon:  Icon(Icons.person_rounded),
            activeIcon:  Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: NxColor.primary,
        unselectedItemColor: const Color(0xffc2c3c2),
        onTap: selectIndex,
      ),
    );
  }
}
