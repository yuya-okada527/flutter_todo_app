class TaskModel {
  late final int userId;
  late final String title;
  late final bool completed;

  TaskModel(this.userId, this.title, this.completed);

  TaskModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    title = json['title'];
    completed = json['completed'];
  }
}
