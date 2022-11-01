import '../repository/storage.dart';

class Todo {
  static int _id = ++lastIndex;
  int? id; //fix ID incrementation.
  final String? text;
  String? dateTime;

  Todo(this.text, this.dateTime) : id = _id++;

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'],
        dateTime = json['dateTime'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'text': text, 'dateTime': dateTime};
}
