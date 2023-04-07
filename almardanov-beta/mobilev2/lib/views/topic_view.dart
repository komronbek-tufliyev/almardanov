import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilev2/models/topic_item_model.dart';

class TopicItemAPIService {
  late int topicId;
  late final String _url =
      'https://almardanov.herokuapp.com/api/v1/topics/$topicId';
  late Dio _dio;

  TopicItemAPIService({required this.topicId}) {
    _dio = Dio(BaseOptions(
      baseUrl: _url,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
  }

  Future<TopicItemModel> getTopic() async {
    try {
      Response response = await _dio.get(_url);
      if (response.statusCode == 200) {
        TopicItemModel topic = TopicItemModel.fromJson(response.data);
        return topic;
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

class TopicItemView extends StatelessWidget {
  const TopicItemView({Key? key, required this.topicId}) : super(key: key);
  final int topicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topic: $topicId'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: TopicItemAPIService(topicId: topicId).getTopic(),
        builder:
            (BuildContext context, AsyncSnapshot<TopicItemModel> snapshot) {
          if (snapshot.hasData) {
            return TopicTile(topic: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class TopicTile extends StatelessWidget {
  final TopicItemModel topic;
  const TopicTile({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(10),
      //     boxShadow: const [
      //       BoxShadow(
      //         color: Colors.black12,
      //         blurRadius: 10,
      //         offset: Offset(0, 10),
      //       ),
      //     ],
      //   ),
      child: Column(
        children: [
          // Image(image: NetworkImage(topic.image)),
          Row(
            children: [
              Text(
                '${topic.id.toString()}.',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(topic.author),
              const SizedBox(width: 5),
              Text(topic.category),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
