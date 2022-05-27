import 'package:flutter/material.dart';

import '../model/work_note_model.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    Key? key,
    required this.task,
  }) : super(key: key);

  final List<WorkNoteModel> task;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context , index){
          return ListTile(
            title: Text("${task[index].title}"),
            trailing: Checkbox(
              value: task[index].isDone,
              onChanged: (value){
                
              }
            ),
          );
        }
      )
    );
  }
}