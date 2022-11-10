import 'dart:convert';
import 'dart:html' hide File;
import 'components/div.dart';
import 'models/todo.dart';
import 'repository/storage.dart';

late InputElement todoInput;
late InputElement dateInput;
late DivElement uiList;
late ButtonElement buttonClear;
late ButtonElement buttonAdd;

void main() async {
  todoInput = querySelector('#todo') as InputElement;
  dateInput = querySelector('#date') as InputElement;

  uiList = querySelector('#todo-list') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;
  buttonAdd = querySelector('#add') as ButtonElement;

  buttonAdd.onClick.listen(addTodo);
  buttonClear.onClick.listen(removeAllTodos);

  await getStorage();
}

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
  addStorage(todoList);
}

void updateTodos() {
  final spin = loadingSpinner();

  uiList.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();

    final checkbox = buildCheckBox();
    final text = buildText(todo.text!);
    final date = buildDeleteEdit(todo.id.toString(), todo.dateTime!);

    final ul = buildUl(checkbox, text, date);

    div.children.add(ul);
    div.className = "";
    uiList.children.add(div);
  });

}

void removeTodo(MouseEvent event) {
  print('Todolist');
  Element button = (event.currentTarget as Element);
  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo.id == key);
  print("after removing");
  addStorage(todoList);
  updateTodos();
}

void removeAllTodos(MouseEvent event) {
  window.localStorage.clear();
  uiList.children.clear();
  todoList.clear();
}
