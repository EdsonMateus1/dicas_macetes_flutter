import 'dart:convert';

class ResultModal {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ResultModal({this.userId, this.id, this.title, this.completed});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory ResultModal.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultModal(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultModal.fromJson(String source) =>
      ResultModal.fromMap(json.decode(source));
}
