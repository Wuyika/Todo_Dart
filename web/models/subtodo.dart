import 'todo.dart';

class SubTodo extends Todo{
  int? foreignKey;
  SubTodo(String? text, String? dateTime, this.foreignKey) : super(text, dateTime);

  SubTodo.fromJson(Map<String, dynamic> json) :
        foreignKey = json["foreignKey"],
        super.fromJson(json);

  Map<String, dynamic> toJson() =>
      {'id': id, 'text': text, 'dateTime': dateTime, 'foreinKey': foreignKey};

}