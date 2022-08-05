import 'package:appbloccubit/cubit/internet_cubit.dart';
import 'package:appbloccubit/presentation/router/app_router.dart';
import 'package:appbloccubit/presentation/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';
import 'package:appbloccubit/presentation/screens/home_screen.dart';
import 'package:appbloccubit/presentation/screens/second_screen.dart';
import 'package:appbloccubit/presentation/screens/third_screen.dart';



void main() {

 /*return BlocOverrides.runZoned(() => {},

   blocObserver: ExBlocObserver(),// muốn chạy này phải để trong main và chạy blocoverride.runzoned
 );*/


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _countercubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {



    /*return BlocProvider(create:(context) => CounterCubit_KDL(),
    lazy: true,
    child:     MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ),
    );*/

    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: "Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       onGenerateRoute: _appRouter.onGenerateRoute,
        // home: Calculator(),
        //home: const MyHomePage(title: "Demo MyHomePage",),
       /* home: BlocProvider<CounterCubit>(
          create: (context) => _countercubit  ,
          child: const HomeScreen(title: "Demo MyHomePage"),
        ),*/
      /*routes: {

          /*
          '/' : (context) => BlocProvider(
            create: (context) => _countercubit,
              child: const HomeScreen(title: "Màn hình chính"),
          ),
          "second" : (context) => BlocProvider(
            create: (context) => _countercubit,
              child: const SecondScreen(title: "Màn hình thứ 2"),
          ),
          "/third" :(context) => BlocProvider(
              create: (context) => _countercubit,
              child: const ThirdScreen(title: "Màn hình thứ 3"),
          ),
          */

          "/":(context) => BlocProvider.value(value: _countercubit,child: const HomeScreen(title: "Màn hình home"),),
          "/second":(context) => BlocProvider.value(value: _countercubit, child:const SecondScreen(title: "Màn hình thứ 2"),),
        "/third":(context) => BlocProvider.value(value: _countercubit, child: const ThirdScreen(title: "Màn hình thứ 3"),),

        },*/
      ),
    );

  }

  @override
  /*void dispose() {
    _countercubit.close();
    super.dispose();
  }*/
void dispose(){
  _appRouter.dispose();
  super.dispose();
  }
}