
import 'package:work_note/blocs/bloc/work_note_event.dart';
import 'package:work_note/blocs/bloc/work_note_state.dart';
import 'package:work_note/model/work_note_model.dart';

import '../bloc_exports.dart';

class NoteBloc extends HydratedBloc<WorkNoteEvent ,WorkNoteState>{

  NoteBloc() : super( const WorkNoteState()){
    on<AddNote>(_onaddNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
  }


  void _onaddNote (AddNote event , Emitter<WorkNoteState> emitter){
    final state = this.state;
     emitter(WorkNoteState(
      allNote: List.from(state.allNote)..add(event.workNoteModel)
    ));

  }

  void _onUpdateNote(UpdateNote event , Emitter<WorkNoteState> emitter){
    final state = this.state;
    final note = event.workNoteModel;
    final int index = state.allNote.indexOf(note);
    List<WorkNoteModel> allNotes = List.from(state.allNote)..remove(note);
    note.isDone == false ? allNotes.insert(index, note.copyWith(isDone: true)): allNotes.insert(index,note.copyWith(isDone: true));
    emitter(WorkNoteState(allNote: allNotes));

  }


  void _onDeleteNote (DeleteNote event , Emitter<WorkNoteState> emitter){
      final state = this.state;
      emitter(WorkNoteState(allNote: List.from(state.allNote)..remove(event.workNoteModel)));
  }

  @override
  WorkNoteState? fromJson(Map<String, dynamic> json) {
    return WorkNoteState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(WorkNoteState state) {
      return state.toMap();
  }

}