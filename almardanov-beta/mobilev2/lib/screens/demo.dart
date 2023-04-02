import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobilev2/components/logger.dart';
// import 'package'

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  void getQuizzess() async {
    var response =
        await Dio().get('http://192.168.43.175:8000/api/v1/quizzes/');
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    getQuizzess();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salom'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/quizzes');
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Quizzes'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
