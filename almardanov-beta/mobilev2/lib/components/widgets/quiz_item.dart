import 'package:flutter/material.dart';
import 'package:mobilev2/components/logger.dart';

class QuizItemModel {
  final String title;
  final String description;
  final String image;
  // final String author;
  // final String date;
  final String time;

  QuizItemModel({
    required this.title,
    required this.description,
    required this.image,
    // required this.author,
    // required this.date,
    required this.time,
  });
}

class QuizItem extends StatelessWidget {
  final QuizItemModel quizItemModel;

  const QuizItem({Key? key, required this.quizItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),

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
      // margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(quizItemModel.image),
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
                      quizItemModel.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 5),
                    Text(
                      quizItemModel.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const QuizPage(),
                          //   ),
                          // ),
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
