import 'package:flutter/material.dart';
import 'package:work_note/blocs/bloc/work_note_event.dart';
import 'package:work_note/blocs/bloc_exports.dart';
import 'package:work_note/screen/home_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:((context) =>NoteBloc()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

