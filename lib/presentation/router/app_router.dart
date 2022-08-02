import 'package:appbloccubit/cubit/counter_cubit.dart';
import 'package:appbloccubit/presentation/screens/home_screen.dart';
import 'package:appbloccubit/presentation/screens/second_screen.dart';
import 'package:appbloccubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter{
  final CounterCubit _counterCubit=CounterCubit();

  Route? onGenerateRoute (RouteSettings routeSettings){
    switch(routeSettings.name){

      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen(title: "Screen Home"),);
        break;

      case "/second":
        return MaterialPageRoute(builder: (context) => const SecondScreen(title: "Second Screen"),);
        break;

      case "/third":
        return MaterialPageRoute(builder: (context) => const ThirdScreen(title: "Third Scree"),);
        break;

      default:
        return null;

      /*case "/":
        return MaterialPageRoute(
         builder: (context) => BlocProvider.value(value: _counterCubit,child: const HomeScreen(title: "Screen Home"),),);
        break;

      case "/second":
        return MaterialPageRoute(builder: (context) => BlocProvider.value(value: _counterCubit,child: const SecondScreen(title: "Màn hình 2"),),);
        break;

      case "/third":
        return MaterialPageRoute(builder: (context) => BlocProvider.value(value: _counterCubit,child: const ThirdScreen(title:"Màn hình thứ 3"),),);
        break;
        default:
          return null;*/


    }
  }


  void dispose(){
    _counterCubit.close();
  }

}