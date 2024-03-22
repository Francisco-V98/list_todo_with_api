import 'package:flutter/material.dart';

class CardListPost extends StatefulWidget {
  final String title;
  final String body;
  const CardListPost({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  State<CardListPost> createState() => _CardListPostState();
}

class _CardListPostState extends State<CardListPost> {
  bool? isCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 20,
                color: Color.fromARGB(255, 72, 72, 82),
              ),
            ),
            const Divider(color: Color.fromARGB(255, 237, 237, 237)),
            Text(
              widget.body,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color.fromARGB(255, 103, 103, 109),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
