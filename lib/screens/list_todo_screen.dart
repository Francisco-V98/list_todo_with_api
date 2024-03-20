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

class RemoteService {
  Future<List<ItemToDo>?> getItems() async {
    try {
      var dio = Dio();
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');

      if (response.statusCode == 200) {
        var json = response.data;
        return itemToDoFromJson(json);
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

class _ListToDoScreenState extends State<ListToDoScreen> {
  List<ItemToDo>? itemToDo;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    itemToDo = await RemoteService().getItems();
    if (itemToDo != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 220, 220),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: dateData(),
            ),
            isLoaded
                ? Expanded(
                    child: ListView.builder(
                      itemCount: itemToDo!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardListToDo(
                          title: itemToDo![index].title,
                          completed: itemToDo![index].completed,
                        );
                      },
                    ),
                  )
                : const Center(heightFactor: 15,
                    child: CircularProgressIndicator(),
                  ),
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
