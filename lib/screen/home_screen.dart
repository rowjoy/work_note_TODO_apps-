// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:star_menu/star_menu.dart';
import 'package:work_note/blocs/bloc/work_note_state.dart';
import 'package:work_note/blocs/bloc_exports.dart';
import 'package:work_note/helpers/bottom_model_sheet.dart';
import 'package:work_note/model/work_note_model.dart';
class HomeScreen extends StatelessWidget {
 HomeScreen({ Key? key }) : super(key: key);

 final CustomBottomSheet _bottomSheet = CustomBottomSheet();
 StarMenuController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc , WorkNoteState>(
      builder: ( context , state ){
        List<WorkNoteModel> task = state.allNote;
        return Scaffold(
        appBar: AppBar(
            title: Text("ALL Note"),
            actions: [
              IconButton(onPressed: ()=> _bottomSheet.addNote(context), icon: Icon(Icons.add)),
            ],
        ),
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
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListTile(
                            title: Text("Task 1"),
                            subtitle: Text("The roll is roll"),
                            trailing: StarMenu(
                                controller: controller,
                                params: StarMenuParameters(
                                  shape: MenuShape.circle,
                                  useScreenCenter: false,
                                  checkItemsScreenBoundaries: true,
                                  checkMenuScreenBoundaries: true,
                                  onItemTapped: ( index ,controller){
                                    if(index == 0){
                                      print("Edit");
                                      controller.closeMenu();
                                    }else if(index == 2){
                                      print("Done");
                                      controller.closeMenu();
                                    }else if(index == 1){
                                      print("Delete");
                                      controller.closeMenu();
                                    }
                                  }
                                ),
                                lazyItems: () async{
                                  return [
                                    CircleAvatar(child: Icon(Icons.edit)),
                                    CircleAvatar(child: Icon(Icons.delete)),
                                    CircleAvatar(child: Icon(Icons.done)),

                                  ];
                                },
                                
                                child: Icon(Icons.more_vert),
                              ),
                          ),
                        ),
                      );
                      // return ListTile(
                      //   title: Text("${task[index].title}"),
                      //   trailing: Checkbox(
                      //     value: task[index].isDone,
                      //     onChanged: (value){
                      //       context.read<NoteBloc>().add(UpdateNote(workNoteModel: task[index]));
                      //     }
                      //   ),
                      //   onLongPress: ()=> context.read<NoteBloc>().add(DeleteNote(workNoteModel: task[index])),  
                      // );
                    }
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=> _bottomSheet.addNote(context),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

