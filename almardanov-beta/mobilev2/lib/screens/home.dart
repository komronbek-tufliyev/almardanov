import 'package:flutter/material.dart';
import 'package:mobilev2/screens/demo.dart';
import 'package:mobilev2/screens/home_page.dart';
import 'package:mobilev2/screens/quizzes_page.dart';
// import 'package:mobilev2/screens/search_screen.dart';
import 'package:mobilev2/screens/profile_page.dart';
import 'package:mobilev2/screens/topics_page.dart';

import '../components/navigation-bars/bottom_nav.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _children = [
    const HomePage(
      title: 'Salom Alm',
    ),
    const TopicsPage(),
    const Demo(),
    // const Text('Topci Page'),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: SafeArea(
        // color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            enableFeedback: true,
            currentIndex: _selectedIndex,
            elevation: 5,
            unselectedItemColor: const Color(0x9C29A5A5),
            selectedItemColor: const Color(0xFF4DB6AC),
            mouseCursor: MouseCursor.defer,
            onTap: _onItemTapped,
            items: bottomNavItems,
          ),
        ),
      ),
    );
  }
}
