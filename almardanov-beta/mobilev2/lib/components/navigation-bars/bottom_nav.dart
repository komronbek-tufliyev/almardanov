import 'package:flutter/material.dart';

const bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Home',
    tooltip: "Home",
    backgroundColor: Color(0xFFFFF59D),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.menu_book_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Topics',
    tooltip: "Topics",
    backgroundColor: Color(0xFFFFF59D),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.edit_note_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Note',
    tooltip: "Note",
    backgroundColor: Color(0xFFFFF59D),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.account_circle_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Profile',
    tooltip: "Profile",
    backgroundColor: Color(0xFFFFF59D),
  ),
];
