import 'dart:convert';
import 'dart:html';
import '../models/todo.dart';
import '../main.dart';
import '../todo_actions/todo_actions.dart';

// late Storage storage;
late dynamic arrTodos;
late dynamic arrSubTodos;
List<Todo> todoList = [];
late int lastIndex;

getTodoStorage() {
  arrTodos = window.localStorage['todos'];
  arrSubTodos = window.localStorage['subtodos'];
  if(arrTodos == "" || (arrTodos == null)){
    window.localStorage['todos'] = todoList.toString();
    arrTodos = window.localStorage['todos'];
  }

  // print("getStorage called");

  final todos = jsonDecode(arrTodos);
  // print(todos);
  todos.forEach((element) {
    Todo singleTodo = Todo.fromJson(element);
    todoList.add(singleTodo);
  });

  if(todoList.isEmpty || todoList == null){
    lastIndex = 0;
  }
  else{
    lastIndex = todoList.elementAt(todoList.length-1).id!;
  }
  // updateTodos();
 return todoList;
}

// void displayTodo(List list, String header){
//   list.forEach((element) {
//
//     print([element.id, element.text]);
//
//   });
//   print(header);
// }

addTodoStorage(List todolist){
  print('\n adding to local storage');
  window.localStorage["todos"] = jsonEncode(todolist);
  final done = window.localStorage['todos'];

  print(done);

  print('\n done adding');
  // displayTodo(todoList, 'Finished adding to local storage');

}