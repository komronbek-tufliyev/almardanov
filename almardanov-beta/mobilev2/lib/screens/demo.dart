import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  void getQuizzess() async {
    var response =
        // await Dio().get('http://192.168.43.175:8000/api/v1/quizzes/'); // for home computer
        await Dio().get(
            'https://almardanov.herokuapp.com/api/v1/quizzes/'); // for work computer
    if (kDebugMode) {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    getQuizzess();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salom'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(20),
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
              child: Container(
                padding: const EdgeInsets.all(20),
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
