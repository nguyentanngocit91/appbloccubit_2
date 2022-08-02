import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit_KDL extends Cubit<int>{

  CounterCubit_KDL():super(0);

  void tang()=> emit(state+1);

  void giam() => emit(state-1);

}

