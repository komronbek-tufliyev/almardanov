import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilev2/models/question_model.dart';

class QuizViewAPIService {
  late int quizId;
  late final String _url =
      'https://almardanov.herokuapp.com/api/v1/quizzes/$quizId';
  late Dio _dio;

  QuizViewAPIService({required this.quizId}) {
    _dio = Dio(BaseOptions(
      baseUrl: _url,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
  }

  Future<List<QuestionModel>> getQuestions() async {
    try {
      Response response = await _dio.get(_url);
      if (response.statusCode == 200) {
        List<QuestionModel> questions = List<QuestionModel>.from(
            response.data.map((x) => QuestionModel.fromJson(x)));
        return questions;
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        throw Exception('Error: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception(e);
    }
  }
}

class QuizView extends StatelessWidget {
  const QuizView({Key? key, required this.quizId}) : super(key: key);
  final int quizId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizView: $quizId'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: QuizViewAPIService(quizId: quizId).getQuestions(),
        builder: (BuildContext context,
            AsyncSnapshot<List<QuestionModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return QuestionTile(question: snapshot.data![index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  final QuestionModel question;
  const QuestionTile({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
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
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${question.id.toString()}.',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  question.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(question.answer1),
          const SizedBox(height: 10),
          Text(question.answer2),
          const SizedBox(height: 10),
          Text(question.answer3),
          const SizedBox(height: 10),
          Text(question.answer4),
        ],
      ),
    );
  }
}
