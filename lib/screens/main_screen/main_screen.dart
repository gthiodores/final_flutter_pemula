import 'package:final_flutter_pemula/models/notes.dart';
import 'package:final_flutter_pemula/screens/detail_screen/detail_screen.dart';
import 'package:final_flutter_pemula/widgets/main_screen/notes_list_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Notes> _notes = dummyNotesList;

  void onAddNotes() async {
    Notes? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(
            note: Notes(
              id: _notes.length + 1,
              title: "",
              body: "",
              lastEdit: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        },
      ),
    );
    setState(() {
      if (result != null) {
        if (result.title.isNotEmpty || result.body.isNotEmpty) {
          _notes.add(result);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Empty Note Discarded")));
        }
      }
    });
  }

  void onEditNotes(Notes note) async {
    Notes? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailScreen(note: note)
        },
      ),
    );
    setState(() {
      if (result != null) {
        if (result.body.isNotEmpty || result.title.isNotEmpty) {
          final index = _notes.indexWhere((element) => element.id == result.id);
          _notes[index] = result;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Final Submission",
        ),
      ),
      body: ListView.builder(
        itemCount: dummyNotesList.length,
        itemBuilder: (BuildContext context, index) {
          return NotesListItem(
            key: Key(index.toString()),
            notes: dummyNotesList[index],
            onClick: () {
              onEditNotes(dummyNotesList[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddNotes,
        child: const Icon(Icons.add),
      ),
    );
  }
}
