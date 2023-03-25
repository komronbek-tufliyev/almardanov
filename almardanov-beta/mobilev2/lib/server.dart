import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobilev2/components/logger.dart';

Future<List<String>> fetchTopics() async {
  var url = Uri.parse('https://almardanov.herokuapp.com/api/topics');

  var response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as List<dynamic>;
    showSuccess('Topics fetched successfully');

    final listOfData = data.map((e) => e.toString()).toList();
    showInfo(listOfData.toString());
    return listOfData;
  } else {
    showError('Failed to fetch topics');
    throw Exception('Failed to load data');
  }
}
