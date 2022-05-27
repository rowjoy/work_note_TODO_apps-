// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work_note/blocs/bloc/work_note_event.dart';
import 'package:work_note/blocs/bloc/work_note_state.dart';
import 'package:work_note/blocs/bloc_exports.dart';
import 'package:work_note/model/work_note_model.dart';

import '../widget/note_list_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

final TextEditingController _controller = TextEditingController();


  void _addNote(BuildContext context ){
        showModalBottomSheet(
          context: context,
            builder: (context){
              return SingleChildScrollView(
                child: Container(
                  padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    height: 300,
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("Add Note",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: _controller,
                          autofocus: true,
                          decoration: InputDecoration(
                            label: Text("Title"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Cancle")),
                            ElevatedButton(onPressed: (){
                              var note = WorkNoteModel(title: _controller.text);
                              context.read<NoteBloc>().add(AddNote(workNoteModel: note));
                            }, child: Text("Save Note")),
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc , WorkNoteState>(
      builder: ( context , state ){
        List<WorkNoteModel> task = state.allNote;
        print(state.allNote);
        return Scaffold(
        body: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
                Center(
                child: Chip(
                    label: Text("Task"),
                  ),
                ),
                Expanded(
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
                  ),
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: ()=>_addNote(context),
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text("ALL Note"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            ],
          ),
        );
      },
    );
  }
}

