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

var dummyNotesList = [
  Notes(
    id: 1,
    title: "Lorem Ipsum",
    body: "Lorem Ipsum",
    lastEdit: 120014184092,
  ),
  Notes(
    id: 2,
    title: "Test Title",
    body: "Test Body",
    lastEdit: 2139802819812,
  ),
  Notes(
    id: 3,
    title: "Test Title 2",
    body: "Test Body 2",
    lastEdit: 2159802819842,
  ),
];
