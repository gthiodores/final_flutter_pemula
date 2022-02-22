class Notes {
  int id;
  String title;
  String body;
  int lastEdit;

  Notes({
    required this.id,
    this.title = "",
    this.body = "",
    this.lastEdit = 0,
  });
}
