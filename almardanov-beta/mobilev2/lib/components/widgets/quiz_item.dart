import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mobilev2/models/quiz_model.dart';

class QuizItemAPIService {
  final String _url = 'http://172.16.13.98:8000/api/v1/quizzes/';
  late Dio _dio;

  QuizItemAPIService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://172.16.13.98:8000/api/v1/quizzes/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));
  }

  Future<Quiz> getQuizzes() async {
    try {
      Response response = await _dio.get('http://172.16.13.98:8000/api/v1/quizzes/');
      if (response.statusCode == 200) {
        Quiz quizItemResponse = Quiz.fromJson(response.data);
        Quiz quizzes = quizItemResponse;
        return quizzes;
      } else {
        print('Error: ${response.statusCode}');
        throw Exception('Error: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}

class QuizItem extends StatelessWidget {
  final Quiz quizItem;
  const QuizItem({
    Key? key,
    required this.quizItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('salom'));
  }
}

class ResultTile extends StatelessWidget {
  final Result result;
  const ResultTile({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(result.id.toString()),
        Text(result.category.toString()),
        Text(result.categoryId.toString()),
        Text(result.questionsCount.toString()),
      ]),
    );
  }
}
