import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     image: DecorationImage(
              //       image: AssetImage(quizItemModel.image),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quizItemModel.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      quizItemModel.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        // Text(
                        //   quizItemModel.author,
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // Text(
                        //   quizItemModel.date,
                        //   style: const TextStyle(
                        //     fontSize: 14,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.timer,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          quizItemModel.time,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
        ],
      ),
    );
  }
}
