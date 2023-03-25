import 'package:flutter/material.dart';

const bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Home',
    tooltip: "Home",
    backgroundColor: Color(0xFFFFF59D),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.history_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'History',
    tooltip: "History",
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
      Icons.settings_outlined,
      color: Color(0xFF4DB6AC),
    ),
    label: 'Settings',
    tooltip: "Settings",
    backgroundColor: Color(0xFFFFF59D),
  ),
];
