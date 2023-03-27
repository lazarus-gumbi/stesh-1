import 'package:flutter/material.dart';
import 'package:stesh/constants.dart';
import 'package:stesh/map.dart';
import 'package:stesh/travel.dart';
import 'package:stesh/wallet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List _pages = [
    const MapScreen(),
    const WalletScrren(),
    const TravelScreen()
  ];

  // changing the selected tab on the bottom navigation
  _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) => _changeTab(index),
          showUnselectedLabels: false,
          selectedItemColor: Constants.mySecondaryColor,
          unselectedItemColor: Constants.myDark,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.map_outlined), label: "Map"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: "Travel")
          ]),
    );
  }
}
