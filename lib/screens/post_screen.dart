import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:list_todo_with_api/infrastructure/models/post_modal.dart';
import 'package:list_todo_with_api/widgets/widgets.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel> itemsPost = [];

  @override
  void initState() {
    super.initState();
    getPost();
  }

  Future getPost() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await Dio().get(url);
    try {
      if (response.statusCode == 200) {
        List<dynamic> listDataPost = response.data;
        setState(() {
          itemsPost =
              listDataPost.map((item) => PostModel.fromJson(item)).toList();
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
      floatingActionButton: floatActBtn(context),
      appBar: _appbar(),
      body: itemsPost.isEmpty
          ? const Center(
              heightFactor: 16,
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: itemsPost.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardListPost(
                    title: itemsPost[index].title!,
                    body: itemsPost[index].body!,
                  );
                },
              ),
            ),
    );
  }

  FloatingActionButton floatActBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pop(context);
      },
      backgroundColor: Colors.amber,
      child: const Icon(Icons.swap_horiz),
    );
  }

  AppBar _appbar() {
    return AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      title: const Text('Francisco Colmenarez'),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
