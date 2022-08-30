import 'dart:math';

import 'package:flutter/material.dart';
import 'package:work_note/controller/text_field_controller.dart';

import '../blocs/bloc/work_note_event.dart';
import '../blocs/bloc_exports.dart';
import '../model/work_note_model.dart';

class CustomBottomSheet {

final  CustomController _customController = CustomController();
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
                          controller:_customController.titlecontroller,
                          autofocus: true,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(height: 16,),
                        TextFormField(
                          controller:_customController.subTitleCOntroller,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          minLines: null,
                          maxLines: null,  // If this is null, there is no limit to the number of lines, and the text container will start with enough vertical space for one line and automatically grow to accommodate additional lines as they are entered.
                          decoration: const InputDecoration(
                            label: Text("Subtitle"),
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
                              var note = WorkNoteModel(title: _customController.titlecontroller.text,
                                subTitle: _customController.subTitleCOntroller.text,
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