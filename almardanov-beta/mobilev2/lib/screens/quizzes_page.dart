import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/appbars/search_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';
import 'package:mobilev2/components/widgets/quiz_item.dart';
import 'package:mobilev2/models/quiz_model.dart';

class QuizzesPage extends StatefulWidget {
  const QuizzesPage({Key? key}) : super(key: key);

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends State<QuizzesPage> {
  QuizItemAPIService service = QuizItemAPIService();
  Future<Quiz>? _future;

  @override
  void initState() {
    super.initState();
    QuizItemAPIService service = QuizItemAPIService();

    Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (!mounted) {
        t.cancel();
      } else {
        // _future = service.getQuizzes().then((value) {
        setState(() {
          _future = service.getQuizzes();
        });
        // });
        // setState(() {});
        // service.getQuizzes().then((value) {
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Quizzes'),
      drawer: const DrawerDefault(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBar(),
            const SizedBox(height: 10),
            SafeArea(
              child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot<Quiz> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
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
            ),
          ],
        ),
      ),
    );
  }
}
