import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: 'SET YOUR GOALS',
      ),
      drawer: DrawerDefault(),
      body: Center(
        child: Text('Home screen'),
      ),
    );
  }
}
