import 'package:flutter/material.dart';
import 'package:mobilev2/components/logger.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Color(0xFFE7E7E7),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
            });
          },
          onSubmitted: (value) {
            showInfo('Submitted: $value');
            showDebug('Search term: $_searchText');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Container(
  //           child: Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Row(children: [
  //           Expanded(
  //             child: TextField(
  //               decoration: const InputDecoration(
  //                 hintText: 'Search',
  //                 hintStyle: TextStyle(color: Colors.grey),
  //                 border: OutlineInputBorder(
  //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //                   borderSide: BorderSide(color: Color(0xFFFF0202), width: 2),
  //                 ),
  //               ),
  //               onChanged: (value) {
  //                 setState(() {
  //                   showInfo(value);
  //                 });
  //               },
  //               onSubmitted: (value) => showInfo(value),

  //             ),
  //           ),
  //         ]),
  //       )),
  //     ),
  //   );
  // }
}
