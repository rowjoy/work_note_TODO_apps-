import 'dart:math';

import 'package:flutter/material.dart';

import '../blocs/bloc/work_note_event.dart';
import '../blocs/bloc_exports.dart';
import '../model/work_note_model.dart';

class CustomBottomSheet {

  final TextEditingController _controller = TextEditingController();
  void addNote(BuildContext context ){
        showModalBottomSheet(
          context: context,
            builder: (context){
              return SingleChildScrollView(
                child: Container(
                  padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 300,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text("Add Note",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller: _controller,
                          autofocus: true,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("Cancle")),
                            ElevatedButton(onPressed: (){
                              var note = WorkNoteModel(title: _controller.text,
                                id: Random().nextInt(1000),
                              );
                              context.read<NoteBloc>().add(AddNote(workNoteModel: note));
                            }, child: const Text("Save Note")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        );
    }
}