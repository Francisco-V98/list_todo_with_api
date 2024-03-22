import 'dart:convert';

List<ItemToDo> itemToDoFromJson(String str) =>
    List<ItemToDo>.from(json.decode(str).map((x) => ItemToDo.fromJson(x)));

String itemToDoToJson(List<ItemToDo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemToDo {
  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  ItemToDo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory ItemToDo.fromJson(Map<String, dynamic> json) => ItemToDo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
