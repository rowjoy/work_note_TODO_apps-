import 'package:flutter/material.dart';
import 'package:work_note/blocs/bloc_exports.dart';
import 'package:work_note/leran_bloc/blocs/blocs.dart';
import 'package:work_note/leran_bloc/view/home_screen.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create:((context) => CounterCubit()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  BaseHomeBloc(),
      ),
    );
  }
}

