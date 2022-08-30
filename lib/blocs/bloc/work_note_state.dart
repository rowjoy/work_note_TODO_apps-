import 'package:equatable/equatable.dart';
import 'package:work_note/model/work_note_model.dart';

// ignore: camel_case_types
class WorkNoteState extends Equatable{
  final List<WorkNoteModel> allNote;

  const WorkNoteState({
    this.allNote = const <WorkNoteModel>[],
  });


  @override
  List<Object?> get props => [allNote];
  

  Map<String ,dynamic>toMap(){
    return {
      "allNote" : allNote.map((e) => e.toMap()).toList(),
    };
  }

  factory WorkNoteState.fromMap(Map<String,dynamic> map){
    return WorkNoteState(
      allNote: List<WorkNoteModel>.from(map["allNote"]?.map((x)=>WorkNoteModel.fromMap(x))),
    );
  }
}