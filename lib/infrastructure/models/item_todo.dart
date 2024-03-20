class ItemToDo {
    final int userId;
    final int id;
    final String title;
    final bool completed;

    ItemToDo({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
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
