import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_todo_with_api/infrastructure/models/item_todo.dart';
import 'package:list_todo_with_api/widgets/widgets.dart';

class ListToDoScreen extends StatefulWidget {
  const ListToDoScreen({
    super.key,
  });

  @override
  State<ListToDoScreen> createState() => _ListToDoScreenState();
}

class _ListToDoScreenState extends State<ListToDoScreen> {
  List<ItemToDo> itemsToDo = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    try {
      Response response = await Dio().get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        setState(() {
          itemsToDo = jsonData.map((item) => ItemToDo.fromJson(item)).toList();
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: dateData(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemsToDo.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardListToDo(
                    title: itemsToDo[index].title!,
                    completed: itemsToDo[index].completed,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding dateData() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            '12',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 72, 72, 82),
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JAN',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 72, 72, 82),
                ),
              ),
              Text(
                '2024',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 72, 72, 82),
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            'TUESDAY',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 96, 96, 110),
            ),
          ),
        ],
      ),
    );
  }
}
