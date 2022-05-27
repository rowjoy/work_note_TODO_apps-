// ignore_for_file: camel_case_types

import 'package:equatable/equatable.dart';
import 'package:work_note/model/work_note_model.dart';
 
 abstract class WorkNoteEvent extends Equatable {
  const WorkNoteEvent();

  @override
  List<Object?> get props => [];
}


class AddNote extends WorkNoteEvent{
  final WorkNoteModel workNoteModel;
  const AddNote({
    required this.workNoteModel,
  });
  
  @override
  List<Object?> get props => [];

}


class UpdateNote extends WorkNoteEvent {
  final WorkNoteModel workNoteModel;
  const UpdateNote({
    required this.workNoteModel,
  });

  @override
  List<Object?> get props => [];
}


class DeleteNote extends WorkNoteEvent{
  final WorkNoteModel workNoteModel;
 const DeleteNote({
    required this.workNoteModel,
  });

  @override 
  List<Object?> get props => [];
}