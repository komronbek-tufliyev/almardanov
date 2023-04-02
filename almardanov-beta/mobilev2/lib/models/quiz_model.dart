// import 'dart:convert';

// List<Quiz> postFromJson(String str) =>
//     List<Quiz>.from(json.decode(str).map((x) => Quiz.fromMap(x)));

// class Quiz {
//   Quiz({
//     required this.id,
//     required this.category,
//     required this.title,
//     required this.quizId,
//   });

//   int id;
//   String category;
//   String title;
//   int quizId;

//   factory Quiz.fromMap(Map<String, dynamic> json) => Quiz(
//         id: json["id"],
//         category: json["category"],
//         title: json["title"],
//         quizId: json["quiz_id"],
//       );

// }

// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
  Quiz({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryId,
    required this.questionsCount,
  });

  int id;
  String name;
  String category;
  int categoryId;
  int questionsCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        categoryId: json["category_id"],
        questionsCount: json["questions_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "category_id": categoryId,
        "questions_count": questionsCount,
      };

  static fromMap(json) {}
}
