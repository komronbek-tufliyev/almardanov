import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/appbars/search_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';
import 'package:mobilev2/components/widgets/topic_item2.dart';
import 'package:mobilev2/models/topic_model.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  TopicItemAPIService service = TopicItemAPIService();
  Future<Topic>? _future;

  @override
  void initState() {
    super.initState();
    TopicItemAPIService service = TopicItemAPIService();
    if (!mounted) {
      // t.cancel();
    } else {
      // _future = service.getQuizzes().then((value) {
      setState(() {
        _future = service.getTopics();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Quizzes'),
      drawer: const DrawerDefault(),
      body: Column(
        children: [
          const SearchBar(),
          FutureBuilder<Topic>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.results.length,
                  itemBuilder: (context, index) {
                    return TopicResultTile(
                        result: snapshot.data!.results[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
