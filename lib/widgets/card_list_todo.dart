import 'package:flutter/material.dart';

class CardListToDo extends StatefulWidget {
  final String title;
  final bool? completed;
  const CardListToDo({
    super.key,
    required this.title,
    this.completed = false,
  });

  @override
  State<CardListToDo> createState() => _CardListToDoState();
}

class _CardListToDoState extends State<CardListToDo> {
  bool? isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 72, 72, 82),
              ),
            ),
            const Spacer(),
            Checkbox(
              value: widget.completed ?? isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  isCompleted = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
