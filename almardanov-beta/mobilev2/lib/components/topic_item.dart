import 'package:flutter/material.dart';

class TopicItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const TopicItem({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
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
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.thumb_up,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.comment,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Comment',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
