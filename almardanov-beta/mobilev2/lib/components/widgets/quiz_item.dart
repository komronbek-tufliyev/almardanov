import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobilev2/components/logger.dart';
// import 'package:mobilev2/components/logger.dart';
import 'package:mobilev2/models/quiz_model.dart';
import 'package:http/http.dart' as http;

Future<List<Result>> fetchQuiz() async {
  final url = Uri.parse('http://127.0.0.1:8000/api/v1/quizzes/');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    showInfo('Data: $parsed');
    return parsed.map<Result>((json) => Result.fromMap(json)).toList();
  } else {
    showError('Failed to load data');
    throw Exception('Failed to load data');
  }
}

class QuizItem extends StatefulWidget {
  const QuizItem({Key? key}) : super(key: key);

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  late FutureBuilder<List<Result>> futureQuiz;
  List<Result> _resultList = [];


  @override
  void initState() {
    super.initState();
    fetchQuiz().then((data) {
      setState(() {
        _resultList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Result>>(
      future: fetchQuiz(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          showSuccess('Data loaded successfully');
          showInfo('Data: ${snapshot.data}');
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color(0xff97FFFF),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${snapshot.data![index].title}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${snapshot.data![index]}")
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          showError('Error: ${snapshot.error}');
          return Text('${snapshot.error}');
        }
        showInfo('Loading...');
        return const CircularProgressIndicator();
      },
    );
  }
}



// class QuizItem extends StatelessWidget {
//   final QuizItemModel quizItemModel;

//   const QuizItem({Key? key, required this.quizItemModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       margin: const EdgeInsets.all(10),

//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(0, 10),
//           ),
//         ],
//       ),
//       // margin: const EdgeInsets.only(bottom: 10, top: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 50,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(quizItemModel.image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // mainAxisAlignment: MainAxisAlignment.values[0],
//                   children: [
//                     Text(
//                       quizItemModel.title,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // const SizedBox(height: 5),
//                     Text(
//                       quizItemModel.description,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       // width: 100,
//                       height: 50,
//                       width: 50,
//                       child: IconButton(
//                         onPressed: () {
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => const QuizPage(),
//                           //   ),
//                           // ),
//                           showInfo(
//                             'This is a quiz',
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.chevron_right_rounded,
//                           size: 25,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
