
import 'package:equatable/equatable.dart';

class WorkNoteModel extends Equatable {
  final String? title;
  bool? isDone;
  bool? isDeleted;


  WorkNoteModel({
    this.title,
    this.isDone,
    this.isDeleted,
  }){
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }


  WorkNoteModel copyWith({

    String? title,
    bool? isDone,
    bool? isDeleted,

  }){
    return WorkNoteModel(
      title:  title ?? this.title,
      isDone:  isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }


  Map<String ,dynamic>toMap(){
    return {
      "title": title,
      "isDone": isDone,
      "isDeleted" : isDeleted,
    };
  }

  factory WorkNoteModel.fromMap(Map<String ,dynamic>map){
      return WorkNoteModel(
        title: map["title"] ?? "",
        isDone: map["isDone"],
        isDeleted: map["isDeleted"],
      );
  }

  @override
  List<Object?> get props => [
    title,isDone,isDeleted,
  ];




}