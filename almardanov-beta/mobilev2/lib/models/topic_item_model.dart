// To parse this JSON data, do
//
//     final topicItemModel = topicItemModelFromJson(jsonString);

import 'dart:convert';

TopicItemModel topicItemModelFromJson(String str) =>
    TopicItemModel.fromJson(json.decode(str));

String topicItemModelToJson(TopicItemModel data) => json.encode(data.toJson());

class TopicItemModel {
  TopicItemModel({
    required this.id,
    required this.category,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.createdDate,
    required this.updatedDate,
  });

  int id;
  String category;
  String title;
  String author;
  String description;
  String image;
  DateTime createdDate;
  DateTime updatedDate;

  factory TopicItemModel.fromJson(Map<String, dynamic> json) => TopicItemModel(
        id: json["id"],
        category: json["category"],
        title: json["title"],
        author: json["author"],
        description: json["description"],
        image: json["image"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "title": title,
        "author": author,
        "description": description,
        "image": image,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
      };

}
