import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/logger.dart';
import 'package:mobilev2/components/navigation-bars/bottom_nav.dart';

import '../components/drawer_default.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(
  //   fontSize: 30,
  //   fontWeight: FontWeight.bold,
  // );
  static const List<Widget> _widgetOptions = <Widget>[
    // HomePage(title: 'Home'),
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 0: Home',
    ),
    // SearchScreen(),
    // TopicsPage(),
    // SearchScreen(),
  ];
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: History',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Quizzes',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 3: Settings',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      drawer: const DrawerDefault(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showInfo('Increment');
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
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
      )),
    );
  }
}
