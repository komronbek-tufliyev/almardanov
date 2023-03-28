import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("jonathan"),
            accountEmail: Text("jonathan@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/favicon.png",
              ),
            ),
            arrowColor: Color(0xFFFFF59D),
          ),
          const ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text(
              'Activity',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          const ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: Text(
              'Contact',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          const ListTile(
            leading: Icon(Icons.share_outlined),
            title: Text(
              'Share',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          const Divider(
            color: Color(0xFF6CD4CA),
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text(
              'Settings',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
            onTap: () {
              // exit app
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text(
              'Exit',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: const Color(0xFF6CD4CA),
            onTap: () {
              // exit app
              Navigator.pop(context);
              Future.delayed(const Duration(milliseconds: 1000), () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              });
              // if (Platform.isAndroid) {
              //   SystemNavigator.pop();
              // } else if (Platform.isIOS) {
              //   exit(0);
              // }
            },
          ),
        ],
      ),
    );
  }
}
