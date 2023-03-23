import 'package:flutter/material.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Default App Bar'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Search');
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            print('More');
          },
        ),
      ],
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}