import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/notes.dart';

class NotesListItem extends StatelessWidget {
  final Notes notes;
  final VoidCallback? onClick;

  const NotesListItem({
    Key? key,
    required this.notes,
    this.onClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Card(
        child: ListTile(
          title: Text(
            notes.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            notes.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            DateFormat("yyyy/MM/dd").format(
              DateTime.fromMillisecondsSinceEpoch(notes.lastEdit),
            ),
          ),
        ),
      ),
    );
  }
}
