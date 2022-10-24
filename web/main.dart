import 'dart:html';
import 'todo.dart';


late InputElement todoInput;
late DivElement uiList;
late ButtonElement buttonClear;

const List<Todo> todoList = [];

void main() {
  todoInput = querySelector('#todo') as InputElement;
  uiList = querySelector('#todo-list') as DivElement;
  buttonClear = querySelector('#clear') as ButtonElement;

  todoInput.onChange.listen(addTodo);
  buttonClear.onClick.listen(removeAllTodos);
}

void addTodo(Event event) {
  Todo todo = Todo(todoInput.value);
  todoList.add(todo);

  updateTodos();
  todoInput.value = '';
}

void updateTodos() {
  uiList.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();
    ButtonElement buttonRemove = ButtonElement();
    Element span = Element.span();

    buttonRemove.text = 'X';
    buttonRemove.id = todo.id.toString();
    buttonRemove.onClick.listen(removeTodo);

    span.text = todo.text;

    div.children.add(buttonRemove);
    div.children.add(span);
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
  uiList.children.clear();
  todoList.clear();
}

