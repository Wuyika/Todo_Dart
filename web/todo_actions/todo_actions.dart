
import 'dart:html';

import '../components/div.dart';
import '../main.dart';
import '../models/todo.dart';
import '../repository/todo_storage.dart';

void addTodo(Event event) {
  print('\n adding todo task');

  Todo todo = Todo(todoInput.value, dateInput.value);
  if (todoInput.value == "" || dateInput.value == "") {
    return;
  }
  todoList.add(todo);
  updateTodos();
  todoInput.value = '';
  dateInput.value = '';
  addTodoStorage(todoList);
}

void updateTodos() {
  // DivElement divElement = DivElement();


  uiList.children.clear();
  DivElement div = DivElement();

  todoList.forEach((todo) {

    final spin = addSubButton();
    final checkbox = buildCheckBox();
    final text = buildText(todo.text!);
    final date = buildDeleteEdit(todo.id.toString(), todo.dateTime!);

    final ul = buildUl(checkbox, text, spin, date);
    final ul_1 = subTask(todo.id);
    div.children.add(ul);
    div.children.add(ul_1);

  });


  uiList.children.add(div);
}

void removeTodo(MouseEvent event) {
  print('Todolist');
  Element button = (event.currentTarget as Element);
  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo.id == key);
  print("after removing");
  addTodoStorage(todoList);
  updateTodos();
}


void removeAllTodos(MouseEvent event) {
  window.localStorage.clear();
  uiList.children.clear();
  todoList.clear();
}

void editTodos(MouseEvent event) {
  print('edit function');
  Element button = (event.currentTarget as Element);
  int id = int.parse(button.id.split('-')[0]);
  print(id);
  Todo todo = todoList.elementAt(1);

  todoInput.value = todo.text;
  dateInput.value = todo.dateTime;
  addTodo;
  removeTodo;
}

