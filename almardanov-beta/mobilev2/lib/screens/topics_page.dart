import 'package:flutter/material.dart';
import 'package:mobilev2/components/topic_item.dart';

class TopicsPage extends StatelessWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
      ),
      body: ListView(children: const <Widget>[
        TopicItem(
          title: 'Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
        ),
        TopicItem(
          title: 'Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
        ),
        TopicItem(
          title: 'Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
        ),
        TopicItem(
          title: 'Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
        ),
        TopicItem(
          title: 'Flutter',
          description:
              'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
          imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
        ),
      ]),
    );
  }
}
