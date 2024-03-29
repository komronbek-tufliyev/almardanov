import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilev2/models/topic_model.dart';
import 'package:mobilev2/views/topic_view.dart';

import '../logger.dart';

class TopicItemAPIService {
  final String _url = 'https://almardanov.herokuapp.com/api/v1/topics/';
  late Dio _dio;

  TopicItemAPIService() {
    _dio = Dio(BaseOptions(
      baseUrl: _url,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
  }

  Future<Topic> getTopics() async {
    try {
      Response response = await _dio.get(_url);
      if (response.statusCode == 200) {
        Topic topicItemResponse = Topic.fromJson(response.data);
        Topic topics = topicItemResponse;
        return topics;
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

class TopicItem extends StatelessWidget {
  const TopicItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TopicResultTile extends StatelessWidget {
  final Result result;
  const TopicResultTile({
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
                    image: const DecorationImage(
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
                    Flexible(
                      child: Text(
                        // if result.name length is more than 20, then show only first 20 characters
                        result.title.length > 30
                            ? '${result.title.substring(0, 30)}...'
                            : result.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // const SizedBox(height: 5),
                    Flexible(
                      child: Text(
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
                        icon: IconButton(
                          icon: const Icon(
                            Icons.chevron_right_rounded,
                            size: 25,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            showInfo(
                              'This is a quiz',
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TopicItemView(topicId: result.id),
                              ),
                            );
                          },
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
