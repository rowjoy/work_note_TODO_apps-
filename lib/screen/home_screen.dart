// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:work_note/model/work_note_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WorkNoteModel>task =[
    WorkNoteModel(title: "Task 1"),
    WorkNoteModel(title: "Task 2"),
    WorkNoteModel(title: "Task 3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("hello"),
          ],
        ),
      ),
    );
  }
}