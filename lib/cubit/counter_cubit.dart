import 'dart:async';
import 'package:appbloccubit/constants/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_cubit.dart';
part 'counter_state.dart';

  class CounterCubit extends Cubit<CounterState>{

    final InternetCubit? internetCubit;
    late StreamSubscription? internetCubitStreamSubscription;

  CounterCubit({ this.internetCubit}):super(CounterState(counterValue: 0)){

    internetCubitStreamSubscription =  internetCubit?.listen((internetState){

      if (internetState is InternetConnected && internetState.connectionType==ConnectionType.wifi){

        increment();

      }
      else if (internetState is InternetConnected && internetState.connectionType==ConnectionType.mobile){

        decrement();

      }

    })!;

  }

  void increment() => emit(CounterState(counterValue: state.counterValue+1));

  void decrement() => emit(CounterState(counterValue: state.counterValue-1));


  void loopDes() => emit(CounterState(counterValue: (state.counterValue-10)));

  void divisible() => emit(CounterState(counterValue: state.counterValue%2));

@override
  Future<void> close(){
    internetCubitStreamSubscription?.cancel();
    return super.close();
  }

}

