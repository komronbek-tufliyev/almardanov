import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mobilev2/components/logger.dart';
import 'package:mobilev2/models/quiz_model.dart';

class QuizItemAPIService {
  final String _url = 'https://almardanov.herokuapp.com/api/v1/quizzes/';
  late Dio _dio;

  QuizItemAPIService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://almardanov.herokuapp.com/api/v1/quizzes/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
  }

  Future<Quiz> getQuizzes() async {
    try {
      Response response =
          await _dio.get('https://almardanov.herokuapp.com/api/v1/quizzes/');
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
      child: const Text('salom'),
    );
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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        // get random unsplash image
                        'https://source.unsplash.com/random/200x200',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.values[0],
                  children: [
                    Text(
                      // if result.name length is more than 20, then show only first 20 characters
                      result.name.length > 30
                          ? '${result.name.substring(0, 30)}...'
                          : result.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // const SizedBox(height: 5),
                    Text(
                      // result.category ,
                      // if result.category length is more than 20, then show only first 20 characters
                      result.category.length > 40
                          ? '${result.category.substring(0, 40)}...'
                          : result.category,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      // width: 100,
                      height: 50,
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          showInfo(
                            'This is a quiz',
                          );
                        },
                        icon: const Icon(
                          Icons.chevron_right_rounded,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
