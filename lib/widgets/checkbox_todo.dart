import 'package:flutter/material.dart';

class ChecboxToDo extends StatefulWidget {
  final bool completed;
  final ValueChanged<bool?> onChanged;
  const ChecboxToDo({
    super.key,
    required this.onChanged,
    required this.completed,
  });

  @override
  State<ChecboxToDo> createState() => _ChecboxToDoState();
}

class _ChecboxToDoState extends State<ChecboxToDo> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.completed,
      onChanged: widget.onChanged,
    );
  }
}