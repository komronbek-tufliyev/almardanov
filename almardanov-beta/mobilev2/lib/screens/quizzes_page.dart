import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';
import 'package:mobilev2/components/widgets/quiz_item.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  // list of quizzes
  List quizzes = [
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
    QuizItemModel(
      title: 'Quiz 1',
      description: 'Quiz 1 description',
      image: 'assets/images/item.png',
      // author: 'Quiz 1 author',
      // date: 'Quiz 1 date',
      time: 'Quiz 1 time',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Quizzes'),
      drawer: const DrawerDefault(),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: quizzes.length,
            itemBuilder: (context, index) {
              return QuizItem(quizItemModel: quizzes[index]);
            },
          ),
        ),
      ]),
    );
  }
}
