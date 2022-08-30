import 'package:flutter/material.dart';
import 'package:work_note/blocs/bloc_exports.dart';
import 'package:work_note/leran_bloc/blocs/blocs.dart';
class BaseHomeBloc extends StatelessWidget {
  const BaseHomeBloc({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                BlocBuilder<CounterCubit,  int>(
                  builder: (context , count){
                    return Text("$count",style: const TextStyle(
                 color: Colors.red,
                 fontSize: 200,
               ),);
                }),
               ElevatedButton(
                 onPressed: ()=> context.read<CounterCubit>().increment(),
               child: const Text("Increment")
              ),
              ElevatedButton(
                 onPressed: ()=> context.read<CounterCubit>().increment(),
               child: const Text("decrement")
              )
            ],
          ),
        )
      ),
    );
  }
}