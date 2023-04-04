import 'package:flutter/material.dart';
import 'package:mobilev2/components/appbars/default_app_bar.dart';
import 'package:mobilev2/components/drawer_default.dart';
import 'package:mobilev2/components/widgets/topic_item.dart';
import 'package:mobilev2/components/widgets/topic_item2.dart';
import 'package:mobilev2/models/topic_model.dart';

// // get the topics from the server

// // class TopicsPage extends StatefulWidget {
// class TopicsPage extends StatelessWidget {
//   const TopicsPage({Key? key}) : super(key: key);

// //   @override
// //   State<TopicsPage> createState() => _TopicsPageState();
// // }

// // class _TopicsPageState extends State<TopicsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Topics'),
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: const <Widget>[
//             TopicItem(
//               title: 'Flutter',
//               description:
//                   'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
//               imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
//             ),
//             TopicItem(
//               title: 'Flutter',
//               description:
//                   'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
//               imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
//             ),
//             TopicItem(
//               title: 'Flutter',
//               description:
//                   'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
//               imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
//             ),
//             TopicItem(
//               title: 'Flutter',
//               description:
//                   'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
//               imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
//             ),
//             TopicItem(
//               title: 'Flutter',
//               description:
//                   'Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia, and the web from a single codebase.',
//               imageUrl: 'https://avatars.githubusercontent.com/u/55942632?v=4',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      body: SafeArea(
        child: FutureBuilder<Topic>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return TopicResultTile(result: snapshot.data!.results[index]);
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
