import 'package:work_note/blocs/bloc_exports.dart';

enum Counter {
  inctement,
  decrement,
}



// class CounterAppBlocs extends Bloc<Counter, int>{
//   CounterAppBlocs() : super(0);
//   @override
//   Stream<int> mapEventToState(Counter   emit) async* {
//     switch (emit) {
      
//       case Counter.inctement :
//         yield state + 1;
//         print(state);
//         break;
//       case Counter.decrement: 
//         yield state -1;
//         print(state);
//         break;
//     }
//   }
  
//   }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}