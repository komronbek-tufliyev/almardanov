// To parse this JSON data, do
//
//     final QuestionModel = QuestionModelFromJson(jsonString);

import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
    QuestionModel({
        required this.id,
        required this.quiz,
        required this.text,
        required this.answer1,
        required this.answer2,
        required this.answer3,
        required this.answer4,
    });

    int id;
    String quiz;
    String text;
    String answer1;
    String answer2;
    String answer3;
    String answer4;

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        quiz: json["quiz"],
        text: json["text"],
        answer1: json["answer1"],
        answer2: json["answer2"],
        answer3: json["answer3"],
        answer4: json["answer4"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quiz": quiz,
        "text": text,
        "answer1": answer1,
        "answer2": answer2,
        "answer3": answer3,
        "answer4": answer4,
    };
}
