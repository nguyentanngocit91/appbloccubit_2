import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appbloccubit/cubit/counter_cubit.dart';
import 'package:appbloccubit/presentation/screens/third_screen.dart';
class SecondScreen extends StatefulWidget{
  const SecondScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState ();

}


class _SecondScreenState extends State<SecondScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit ,CounterState>(

                builder: (context,count){

                  if (count.counterValue.toString()!=''){
                    return Text( count.counterValue.toString(),
                      style:const TextStyle(fontSize: 18,fontWeight:FontWeight.w900),
                    );
                  }
                  else{
                    return const Text("0",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),);
                  }


                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    //  BlocProvider.of<CounterCubit>(context).increment();
                    //context.read<CounterCubit>().increment();
                    context.read<CounterCubit>().increment();
                  },
                  child:const Icon(Icons.add),
                ),
                TextButton(
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).decrement();
                    //context.read<CounterCubit>().decrement();
                    context.read<CounterCubit>().decrement();
                  },
                  child: const Icon(Icons.remove),
                ),

                MaterialButton(
                    color: Colors.white,
                    child: const Text("Màn hình thứ 3"),
                    onPressed: () =>{
                      /*Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => BlocProvider.value(value: context.read<CounterCubit>(),
                          child: const ThirdScreen(title: "Màn hình thứ 3"),
                          ),)),*/
                      Navigator.of(context).pushNamed("/third"),
                }),





                TextButton(
                  onPressed:() => {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(create:(context)=>CounterCubit() )))
                },

                  onLongPress: () =>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(create: (context)=>CounterCubit())))
                  },

                    child:const Text("Test thử"),),

                MaterialButton(onPressed: () =>{
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => CounterCubit(),),))
              //  Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlocProvider.value(value: context.read<CounterCubit>()),))
                Navigator.of(context).pushNamed("/routeName"),
                },
                child: const Text("Click thử"),
                )

              ],
            ),


          ],
        ),
      ),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}