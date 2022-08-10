import 'package:appbloccubit/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appbloccubit/cubit/counter_cubit.dart';
import 'package:appbloccubit/presentation/screens/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key, required this.title}) : super(key: key);
 final String title;

 @override
 State<HomeScreen> createState() => _HomeScreenState ();
}

class _HomeScreenState extends State<HomeScreen> {


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

           return Text( count.counterValue.toString(),
            style:const TextStyle(fontSize: 18,fontWeight:FontWeight.w900),
           );

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
        


       ],
      ),

      Column(

       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        MaterialButton(
            color: Colors.blue,
            child:const Text("Button SecondSreen"),
            onPressed: () =>{
            /* Navigator.of(context).push(
                 MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: context.read<CounterCubit>(),
                      child: const SecondScreen(title: "Màn hình thứ 2")),
                 ))*/
              Navigator.of(context).pushNamed("/second"),
            },
        ),

        const SizedBox(height: 24,),

        MaterialButton(
         color: Colors.blue,
         child: const Text("Button Third Sreen"),
         onPressed: () => {
          /*Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlocProvider.value(value: context.read<CounterCubit>(),
           child: const ThirdScreen(title: "Màn hình thứ 3")),)),*/
          Navigator.of(context).pushNamed("/third"),

         },),
        
        Padding(padding: EdgeInsets.all(10)),
        
        MaterialButton(
         padding:EdgeInsets.all(20),
         color: Colors.amber,
         onPressed: () => Navigator.of(context).pushNamed("/secondScreen"),
         child: Text("Màn hình Sản Phẩm",style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.w900),),
        ),

        Padding(padding: EdgeInsets.all(10)),

        MaterialButton(
          padding: EdgeInsets.all(20),
            color: Colors.red,
            onPressed: () => Navigator.of(context).pushNamed("/Calculator"),
           child: Text("Màn Hình Máy Tính",style: TextStyle(color: Colors.white,fontSize: 18,decoration:TextDecoration.none
           ,fontWeight: FontWeight.w900),),
        ),
        
        Padding(padding: EdgeInsets.all(10)),
        
        MaterialButton(onPressed: () => {
         Navigator.of(context).pushNamed("/SliverAppBar_Screen"),
        }, child: Text("Màn hình Sliver App Bar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,decoration: TextDecoration.none),)),


        Padding(padding: EdgeInsets.all(10)),

        MaterialButton(
         color: Colors.amber,
            onPressed: () => {
             Navigator.of(context).pushNamed("/SliverAppBar_Demo"),
            },
        child: Text("Màn Hình Sliver Demo",style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 18),),
        ),
        
        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
         onPressed: () => {
         Navigator.of(context).pushNamed("/TabBar_Screen"),
        },
        color: Colors.deepPurpleAccent,
         child: Text("Tabar Screen",style: TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 18,fontWeight: FontWeight.w900),),
        ),

        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
         color: Colors.white,
         onPressed: () => {
          Navigator.of(context).pushNamed("/MediaQuery_Screen"),
         },
         child: Text("Media Query Screen",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,decoration: TextDecoration.none
         ,color: Colors.deepOrange),),

        ),

        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
         color: Colors.deepPurpleAccent,
         onPressed: () => {
          Navigator.of(context).pushNamed("/AlertDialog_Screen"),
         },
        child: Text("Alert Dialog",style: TextStyle(color: Colors.white,decoration: TextDecoration.none,fontWeight: FontWeight.w900,fontSize: 18,),),
        ),

        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
         color: Colors.blue,
         onPressed: () => {
         Navigator.of(context).pushNamed("/AvatarGlow_Screen"),
        },
        child: Text("Avatar Glow",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,decoration: TextDecoration.none, color: Colors.deepOrangeAccent),),
        ),


        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
         color: Colors.blue,
         onPressed: () => {
          Navigator.of(context).pushNamed("/Timer_Screen"),
         },
         child: Text("Timer Screen",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,decoration: TextDecoration.none, color: Colors.deepOrangeAccent),),
        ),

        Padding(padding: EdgeInsets.all(10)),

        MaterialButton(onPressed: () => {
         Navigator.of(context).pushNamed("/PageView_Scroll_Tiktok"),
        },
         color: Colors.deepOrangeAccent,
         padding: EdgeInsets.only(left: 30,right: 30),
        child: Text("Scroll TikTok",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
        
        Padding(padding: EdgeInsets.all(10)),
        
        MaterialButton(onPressed: () => {
         Navigator.of(context).pushNamed("/Liquid_Pull_Refresh"),

        },
        color: Colors.blue,
        child: Text("Liquid_Pull_Refresh",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),
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