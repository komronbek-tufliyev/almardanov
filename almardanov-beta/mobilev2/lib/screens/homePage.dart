import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      // style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      // style: optionStyle,
    ),
    Text(
      'Index 2: School',
      // style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      // style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            print('Increment');
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          enableFeedback: true,
          currentIndex: _selectedIndex,
          elevation: 5,
          unselectedItemColor: const Color(0x9C56A7A7),
          selectedItemColor: const Color(0x9C09CA8A),
          mouseCursor: MouseCursor.defer,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0x9C56A7A7),
              ),
              label: 'Home',
              tooltip: "Home",
              // backgroundColor: Color.fromRGBO(252, 234, 144, 100),
              backgroundColor: Color(0xFFFFF59D),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history_outlined,
                color: Color(0x9C56A7A7),
              ),
              label: 'History',
              tooltip: "History",
              backgroundColor: Color(0xFFFFF59D),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.edit_note_outlined,
                color: Color(0x9C56A7A7),
              ),
              label: 'Note',
              tooltip: "Note",
              backgroundColor: Color(0xFFFFF59D),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Color(0x9C56A7A7),
              ),
              label: 'Settings',
              tooltip: "Settings",
              backgroundColor: Color(0xFFFFF59D),
            ),
          ],
          // backgroundColor: const Color.fromRGBO(252, 234, 144, 100),
        ),
      ),
    );
  }
}
