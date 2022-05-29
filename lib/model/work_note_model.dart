
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WorkNoteModel extends Equatable {
  final String? title;
  final String? subTitle;
  final int? id;
  bool? isDone;
  bool? isDeleted;
 Color? tileColor;


  WorkNoteModel({
    this.id,
    this.title,
    this.subTitle,
    this.isDone,
    this.isDeleted,
    this.tileColor,
  }){
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }


  WorkNoteModel copyWith({
    int? id,
    String? title,
    String? subTitle,
    bool? isDone,
    bool? isDeleted,

  }){
    return WorkNoteModel(
      id: id ?? this.id,
      title:  title ?? this.title,
      subTitle:  subTitle ?? this.subTitle,
      isDone:  isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }


  Map<String ,dynamic>toMap(){
    return {
      "id":id,
      "title": title,
      "subTitle":subTitle,
      "isDone": isDone,
      "isDeleted" : isDeleted,
      "tileColor": tileColor,
    };
  }

  factory WorkNoteModel.fromMap(Map<String ,dynamic>map){
      return WorkNoteModel(
        id: map["id"],
        title: map["title"] ?? "",
        subTitle: map["subTitle"] ?? "",
        isDone: map["isDone"],
        isDeleted: map["isDeleted"],
        tileColor: map["tileColor"],
      );
  }

  @override
  List<Object?> get props => [
   id, title,isDone,isDeleted,
  ];






}