import 'package:final_flutter_pemula/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatefulWidget {
  final Notes note;

  const DetailScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _textControllerTitle = TextEditingController();
  final _textControllerBody = TextEditingController();


  @override
  void initState() {
    super.initState();
    _textControllerTitle.text = widget.note.title;
    _textControllerBody.text = widget.note.body;
  }

  void _onConfirmed() {
    widget.note
      ..body = _textControllerBody.value.text
      ..title = _textControllerTitle.value.text
      ..lastEdit = DateTime.now().millisecondsSinceEpoch;
    Navigator.pop(context, widget.note);
  }

  @override
  void dispose() {
    _textControllerBody.dispose();
    _textControllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _onConfirmed,
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _textControllerTitle,
                        minLines: 1,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                            hintText: "Title", border: InputBorder.none),
                      ),
                      TextField(
                        controller: _textControllerBody,
                        minLines: 4,
                        maxLines: 32,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Input notes here...",
                        ),
                      ),
                      Text(
                        DateFormat("yyyy/MM/dd").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                widget.note.lastEdit)),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
