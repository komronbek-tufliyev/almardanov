import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';
import 'package:mobilev2/components/widgets/quiz_item.dart';
import 'package:mobilev2/models/quiz_model.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  @override
  void initState() {
    super.initState();
    QuizItemAPIService service = QuizItemAPIService();
    Quiz quiz;
    service.getQuizzes().then((value) {
      setState(() {
        quiz = value;
        print('Quizzes response from initState: ${quiz.toJson()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Quizzes'),
      drawer: const DrawerDefault(),
      body: FutureBuilder(
        future: QuizItemAPIService().getQuizzes(),
        builder: (context, AsyncSnapshot<Quiz> snapshot) {
          print('Quizzes response from build: ${snapshot}');
          if (snapshot.hasData) {
            print(snapshot);
            print(snapshot.data);
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.results.length,
              itemBuilder: (context, index) {
                return ResultTile(result: snapshot.data!.results[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
