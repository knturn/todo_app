class TodoModel {
  int? id;
  String? title;
  String? description;
  bool isDone;
  TodoModel({
    this.id,
    this.title,
    this.description,
    required this.isDone,
  });
  Map<String, dynamic> toMap() {
    // ignore: prefer_collection_literals
    final map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["title"] = title;
    map["description"] = description;
    map["isDone"] = isDone ? 1 : 0;
    map["id"] = id;
    return map;
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
        id: map["id"],
        title: map["title"],
        description: map["description"],
        isDone: map["isDone"] == 1);
  }
}
