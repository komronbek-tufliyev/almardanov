import 'package:flutter/material.dart';
import 'package:mobilev2/screens/home_page.dart';
import 'package:mobilev2/screens/search_screen.dart';
import 'package:mobilev2/screens/profile_page.dart';
import 'package:mobilev2/screens/topics_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({Key? key}) : super(key: key);

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(title: 'SET YOUR GOALS'),
      const SearchScreen(),
      const TopicsPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navsBarItems() {
    return [ 
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeColorPrimary: const Color(0xFF4DB6AC),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history_outlined),
        title: "History",
        activeColorPrimary: const Color(0xFF4DB6AC),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.edit_note_outlined),
        title: "Note",
        activeColorPrimary: const Color(0xFF4DB6AC),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings_outlined),
        title: "Settings",
        activeColorPrimary: const Color(0xFF4DB6AC),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navsBarItems(),
      confineInSafeArea: true,
      backgroundColor: const Color(0xFFFFF59D),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.neumorphic,
    );
  }
}
