// To parse this JSON data, do
//
//     final Topic = TopicFromJson(jsonString);

import 'dart:convert';

Topic topicFromJson(String str) => Topic.fromJson(json.decode(str));

String topicToJson(Topic data) => json.encode(data.toJson());

class Topic {
    Topic({
        required this.count,
        this.next,
        this.previous,
        required this.results,
    });

    int count;
    dynamic next;
    dynamic previous;
    List<Result> results;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
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
        required this.title,
        required this.author,
        required this.description,
        required this.image,
        required this.createdDate,
        required this.updatedDate,
        required this.category,
    });

    int id;
    String title;
    String author;
    String description;
    String image;
    DateTime createdDate;
    DateTime updatedDate;
    String category;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        image: json["image"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "description": description,
        "image": image,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "category": category,
    };
}
