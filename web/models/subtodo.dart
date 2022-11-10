import 'todo.dart';

class SubTodo extends Todo{
  int foreignKey;
  SubTodo( this.foreignKey, String? text, String? dateTime) : super(text, dateTime);
}