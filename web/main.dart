import 'dart:html';
import 'repository/subtodo_storage.dart';
import 'repository/todo_storage.dart';
import 'todo_actions/todo_actions.dart';
import 'todo_actions/sub_todo_actions.dart';

late InputElement todoInput;
late InputElement dateInput;
late DivElement uiList;
late Element subList;
// late ButtonElement buttonClear;
late ButtonElement buttonAdd;

void main() async {

  todoInput = querySelector('#todo') as InputElement;
  dateInput = querySelector('#date') as InputElement;

  uiList = querySelector('#todo-list') as DivElement;
  // buttonClear = querySelector('#clear') as ButtonElement;
  buttonAdd = querySelector('#add') as ButtonElement;

  buttonAdd.onClick.listen(addTodo);
  // buttonClear.onClick.listen(removeAllTodos);

  await getTodoStorage();
  await getSubTodoStorage();
}
