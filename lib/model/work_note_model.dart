
import 'package:equatable/equatable.dart';

class WorkNoteModel extends Equatable {
  final String? title;
  final int? id;
  bool? isDone;
  bool? isDeleted;


  WorkNoteModel({
    this.id,
    this.title,
    this.isDone,
    this.isDeleted,
  }){
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }


  WorkNoteModel copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isDeleted,

  }){
    return WorkNoteModel(
      id: id ?? this.id,
      title:  title ?? this.title,
      isDone:  isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }


  Map<String ,dynamic>toMap(){
    return {
      "id":id,
      "title": title,
      "isDone": isDone,
      "isDeleted" : isDeleted,
    };
  }

  factory WorkNoteModel.fromMap(Map<String ,dynamic>map){
      return WorkNoteModel(
        id: map["id"],
        title: map["title"] ?? "",
        isDone: map["isDone"],
        isDeleted: map["isDeleted"],
      );
  }

  @override
  List<Object?> get props => [
   id, title,isDone,isDeleted,
  ];




}