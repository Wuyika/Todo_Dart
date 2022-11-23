import 'dart:convert';
import 'dart:html';
import '../models/subtodo.dart';
import '../models/todo.dart';
import '../main.dart';
import '../todo_actions/todo_actions.dart';

// late Storage storage;

late dynamic arrSubTodos;
List<SubTodo> subTodoList = [];
late int lastIndex;


getSubTodoStorage() {


  arrSubTodos = window.localStorage['subtodos'];

  if( arrSubTodos == "" || ( arrSubTodos == null)){
    window.localStorage['subtodos'] = subTodoList.toString();
    arrSubTodos = window.localStorage['subtodos'];
  }

  print("get Sub Storage called");

  final subTodos = jsonDecode(arrSubTodos);
  print(subTodos);
  subTodos.forEach((element) {
    SubTodo singleTodo = SubTodo.fromJson(element);
    subTodoList.add(singleTodo);
  });

  updateTodos();
  print('Finished Getting Local storage...');
  return subTodoList;
}

addSubTodoStorage(List subTodolist){
  print('\n adding to local storage');
  window.localStorage["subtodos"] = jsonEncode(subTodolist);
  final done = window.localStorage['subtodos'];

  print(done);

  print('\n done adding');
  // displayTodo(todoList, 'Finished adding to local storage');

}