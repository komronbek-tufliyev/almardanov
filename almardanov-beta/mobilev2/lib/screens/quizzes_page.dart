import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(title: 'Quizzes'),  
      drawer: DrawerDefault(),

    );
  }
}
