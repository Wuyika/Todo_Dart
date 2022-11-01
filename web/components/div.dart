import 'dart:html';

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
  li.className =
      "list-group-item px-3 py-1 d-flex align-items-center flex-grow-1 border-0 bg-transparent";
  return li;
}

buildDeleteEdit(String id, String date) {
  Element pEdit = Element.p();
  Element aEdit = Element.a();
  Element pDelete = Element.p();
  Element aDelete = Element.a();
  DivElement div_1 = DivElement();

  // create edit element
  pEdit.className = "fas fa-pencil-alt me-3 text-info";
  aEdit.children.add(pEdit);
  // create delete element
  pDelete.className = "fas fa-trash-alt text-danger";
  aDelete.id = id;
  // aDelete.onClick.listen();
  aDelete.children.add(pDelete);

  div_1.className = "d-flex flex-row justify-content-end mb-1";
  div_1.children.add(aEdit);
  div_1.children.add(aDelete);

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
  liElement.className =
      "list-group-item ps-3 pe-0 py-1 rounded-0 border-0 bg-transparent";
  liElement.children.add(div_1);
  liElement.children.add(div_2);

  return liElement;
}

buildUl(Element li_1, Element li_2, Element li_3) {
  Element ul = Element.ul();
  ul.children.add(li_1);
  ul.children.add(li_2);
  ul.children.add(li_3);
  ul.className = "list-group list-group-horizontal rounded-0 bg-transparent";
  return ul;
}
