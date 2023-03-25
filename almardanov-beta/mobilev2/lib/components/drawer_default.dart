import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("jonathan"),
            accountEmail: Text("jonathan@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/favicon.png",
              ),
            ),
            arrowColor: Color(0xFFFFF59D),
          ),
          ListTile(
            leading: Icon(Icons.bar_chart_outlined),
            title: Text(
              'Activity',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: Text(
              'Contact',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          ListTile(
            leading: Icon(Icons.share_outlined),
            title: Text(
              'Share',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          Divider(
            color: Color(0xFF6CD4CA),
            thickness: 2,
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              'Settings',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text(
              'Exit',
              style: TextStyle(color: Color(0xFF4DB6AC)),
            ),
            iconColor: Color(0xFF6CD4CA),
          ),
        ],
      ),
    );
  }
}
