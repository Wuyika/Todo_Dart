class Todo {
  static int _id = 0; //fix ID incrementation.
  int id;
  final String? text;

  Todo(
    this.text,
  ) : this.id = _id++;
}
