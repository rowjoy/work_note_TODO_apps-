

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_note/blocs/bloc/work_note_event.dart';
import 'package:work_note/blocs/bloc/work_note_state.dart';

class NoteBloc extends Bloc<WorkNoteEvent ,WorkNoteState>{

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

  }


  void _onDeleteNote (DeleteNote event , Emitter<WorkNoteState> emitter){
      final state = this.state;
  }

}