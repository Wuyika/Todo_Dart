import 'dart:html';
import '../main.dart';
import '../models/subtodo.dart';
import '../repository/subtodo_storage.dart';
import '../repository/todo_storage.dart';
import 'todo_actions.dart';



void addSubTodo(Event event) {
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);

  print(key);

  InputElement inputText = querySelector("#input" + button.id) as InputElement;
  InputElement inputDate = querySelector("#date" + button.id) as InputElement;


  print('\n adding sub todo task');


  SubTodo subTodo = SubTodo( inputText.value, inputDate.value, key);
  if (inputText.value == "" || inputDate.value == "") {
    return;
  }

  print(subTodo.foreignKey);

  subTodoList.add(subTodo);

  updateTodos();
  inputText.value = '';
  inputDate.value = '';
  addSubTodoStorage(subTodoList);
}
