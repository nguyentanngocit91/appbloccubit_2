import 'package:appbloccubit/cubit/counter_cubit.dart';
import 'package:appbloccubit/presentation/screens/calculator_screen.dart';
import 'package:appbloccubit/presentation/screens/home_screen.dart';
import 'package:appbloccubit/presentation/screens/pageNews_quare.dart';
import 'package:appbloccubit/presentation/screens/second_screen.dart';
import 'package:appbloccubit/presentation/screens/sliver_app_bar.dart';
import 'package:appbloccubit/presentation/screens/sliver_appbar_screen.dart';
import 'package:appbloccubit/presentation/screens/test_secondscreenone.dart';
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

      case "/secondScreen1":
        return MaterialPageRoute(builder: (context) => const SecondScreen(title: "Second Screen"),);
        break;

      case "/PageNews_quare":
        return MaterialPageRoute(builder: (context) => PageNews_quare(),);

      case "/secondScreen":
        return MaterialPageRoute(builder: (context) => Ex_SecondScreen(),);

      case "/third":
        return MaterialPageRoute(builder: (context) => const ThirdScreen(title: "Third Scree"),);
        break;

      case "/Calculator":
        return MaterialPageRoute(builder: (context) => Calculator(),);

      case "/SliverAppBar_Screen":
        return MaterialPageRoute(builder: (context) => SliverAppBar_Screen(),);
        
      case "/SliverAppBar_Demo":
        return MaterialPageRoute(builder: (context) => SliverAppBar_View(),);

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