import 'package:appbloccubit/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group('CounterCubit', (){

    CounterCubit counterCubit;
    setUp(() {
      counterCubit= CounterCubit();
    });

    tearDown(() {
     CounterCubit().close();
    });
    
    test('description', ()
    {
      expect(CounterState(counterValue: 1), CounterState(counterValue: 0));
    });

  });
}