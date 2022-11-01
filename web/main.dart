import 'dart:html' hide File;
import 'components/div.dart';
import 'models/todo.dart';
import 'repository/storage.dart';


late Storage storage;
late InputElement todoInput;
late InputElement dateInput;
late DivElement uiList;
late ButtonElement buttonClear;
late ButtonElement buttonAdd;

void main()  async{
  todoInput = querySelector('#todo') as InputElement;
  dateInput = querySelector('#date') as InputElement;

  uiList = querySelector('#todo-list') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;
  buttonAdd = querySelector('#add') as ButtonElement;

  buttonAdd.onClick.listen(addTodo);
  buttonClear.onClick.listen(removeAllTodos);
  // storage = window.localStorage;
  // print(storage.values);

  await getStorage();
  // updateTodos();

  // print("after");
  // print(todos);


}

void addTodo(Event event) {
  print('\n adding todo task');

  Todo todo = Todo(todoInput.value, dateInput.value);
  if (todoInput.value == "" || dateInput.value == "") {
    return;
  }
  todoList.add(todo);
  // displayTodo(todoList, ' finished adding todo task');

  updateTodos();
  todoInput.value = '';
  dateInput.value = '';
  addStorage(todoList);

}

void updateTodos() {

  uiList.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();
    ButtonElement buttonRemove = ButtonElement();

    final checkbox = buildCheckBox();
    final text = buildText(todo.text!);
    final date = buildDeleteEdit(todo.id.toString(), todo.dateTime!);

    final ul = buildUl(checkbox, text, date);
    buttonRemove.text = 'X';
    buttonRemove.id = todo.id.toString();
    buttonRemove.onClick.listen(removeTodo);

    div.children.add(ul);
    // div.children.add(buttonRemove);

    div.className = "";
    uiList.children.add(div);
  });
}

void removeTodo(MouseEvent event) {
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo.id == key);

  div?.remove();
}


void removeAllTodos(MouseEvent event) {
  window.localStorage.clear();
  uiList.children.clear();
  todoList.clear();

}
