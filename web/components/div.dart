import 'dart:convert';
import 'dart:html';
import '../main.dart';
import '../models/subtodo.dart';
import '../repository/subtodo_storage.dart';
import '../repository/todo_storage.dart';
import '../todo_actions/sub_todo_actions.dart';
import '../todo_actions/todo_actions.dart';

// late HtmlElement ell = ;

addSubButton() {
  ButtonElement addSub = ButtonElement();
  DivElement div = DivElement();
  Element ul = Element.ul();
  print("Print alll IU elements");

  // build ul
  // ul.className = "dropdown-menu";

  // build button
  // addSub.id = "subtask";
  // addSub.text = "Add SubTask";
  // addSub.className = "btn btn-primary dropdown-toggle me-4";
  // addSub.type = "button";

  div.appendHtml(
      ' <button class="me-4 btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-mdb-toggle="dropdown" aria-expanded="false" >Sub Task</button> ');
  div.appendHtml(
      ' <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"> <li><a class="dropdown-item" href="#">Action</a></li> <li><a class="dropdown-item" href="#">Another action</a></li> <li><a class="dropdown-item" href="#">Something else here</a></li> </ul>');
  div.className = "dropdown";
  // div.children.add(addSub);
  return div;
}

loadingSpinner() {
  DivElement spinner = DivElement();
  Element span = Element.span();
  span.className = "visually-hidden";
  span.text = "visually hidden...";
  spinner.className = "spinner-border";
  spinner.children.add(span);
  return spinner;
}

buildCheckBox() {
  Element li = Element.li();
  DivElement div = DivElement();
  InputElement inputElement = InputElement();

  inputElement.type = "checkbox";
  inputElement.className = "form-check-input me-0";

  div.children.add(inputElement);
  div.className = "form-check";

  li.children.add(div);
  li.className =
      "list-group-item d-flex align-items-center ps-0 pe-3 py-1 rounded-0 border-0 bg-transparent";
  return li;
}

buildText(String text) {
  Element p = Element.p();
  Element li = Element.li();

  p.text = text;
  p.className = "lead fw-normal mb-0";

  li.children.add(p);
  li.className = "d-flex align-items-center border-0 bg-transparent";
  return li;
}

buildDeleteEdit(String id, String date) {
  Element pEdit = Element.p();
  ButtonElement buttonEdit = ButtonElement();
  Element pDelete = Element.p();
  ButtonElement buttonDelete = ButtonElement();
  DivElement div_1 = DivElement();

  // create edit element
  pEdit.className = "fas fa-pencil-alt text-info";
  buttonEdit.className = "border-0";
  buttonEdit.children.add(pEdit);
  buttonEdit.id = id;
  buttonEdit.onClick.listen(editTodos);
  // create delete element
  pDelete.className = "fas fa-trash-alt text-danger";
  buttonDelete.id = id;
  buttonDelete.type = "button";
  buttonDelete.className = "ms-2 border-0";
  // aDelete.onClick.listen();
  buttonDelete.children.add(pDelete);
  buttonDelete.onClick.listen(removeTodo);

  div_1.className = "d-flex flex-row justify-content-end mb-1";
  div_1.children.add(buttonEdit);
  div_1.children.add(buttonDelete);

  // build text and icon
  Element p1 = Element.p();
  Element p2 = Element.p();
  Element a = Element.a();
  DivElement div_2 = DivElement();

  p1.className = "fas fa-info-circle me-2";
  p2.className = "small mb-0";

  p2.text = date;
  a.className = "text-muted d-flex";
  a.children.add(p1);
  a.children.add(p2);
  div_2.className = "text-end text-muted";
  div_2.children.add(a);

  // final link
  Element liElement = Element.li();
  liElement.className = "rounded-0 border-0 bg-transparent";
  liElement.children.add(div_1);
  liElement.children.add(div_2);

  return liElement;
}

buildUl(Element li_1, Element li_2, Element li_3, Element li_4) {
  Element ul = Element.ul();
  DivElement combine_1 = DivElement();
  DivElement combine_2 = DivElement();

  // 1st
  combine_1.className = "d-flex justify-content-between align-items-center";
  combine_1.children.add(li_1);
  combine_1.children.add(li_2);

  // 2nd
  combine_2.className = "d-flex justify-content-between align-items-center";
  combine_2.children.add(li_3);
  combine_2.children.add(li_4);

  // adding to ul
  ul.children.add(combine_1);
  ul.children.add(combine_2);
  ul.className =
      "d-flex justify-content-between align-items-center rounded-0 bg-transparent";
  return ul;
}

subTask(int? id) {
  DivElement divElement = DivElement();
  ButtonElement buttonElement = ButtonElement();
  InputElement inputElement = InputElement();
  InputElement dateElement = InputElement();
  Element ul_1 = Element.ul();

  buttonElement.id = id.toString();
  buttonElement.className = "ms-4 btn btn-primary";
  buttonElement.text = "Add";
  buttonElement.onClick.listen(addSubTodo);

  dateElement.id = "date" + id.toString();
  dateElement.className = "ms-4";
  dateElement.type = "date";

  inputElement.id = "input" + id.toString();
  inputElement.className = "form-control form-control-sm w-25";
  inputElement.type = "text";

  divElement.children.add(inputElement);
  divElement.children.add(dateElement);
  divElement.children.add(buttonElement);
  divElement.className = "d-flex";

  print(inputElement.id);
  print(dateElement.id);

  ul_1.className = "ms-4 ps-5 d-grid gap-2 ";
  ul_1.children.add(divElement);

  print("checking");

  print(jsonEncode(subTodoList));

  // print(subTodoList.where((todo) => todo.foreignKey == id).toList());

  return ul_1;
}
