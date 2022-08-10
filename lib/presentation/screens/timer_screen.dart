import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Timer_Screen extends StatefulWidget {
  @override
  State<Timer_Screen> createState() => _Timer_ScreenState();
  }

  class _Timer_ScreenState extends State<Timer_Screen> {
  late int LoadTimes=1000;

  void _btn_timer(){
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState((){
        if (LoadTimes>0){
          LoadTimes--;
        }
        else{
          timer.cancel();
        }

        });

    });

  }

  Future<void> _load_reset() async {
    setState((){

      LoadTimes=1000;

    });

   // await LoadTimes;
  }
@override
  Widget build (BuildContext context){
    return Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(LoadTimes==0 ? "Done" : LoadTimes.toString(),style: GoogleFonts.ubuntu(fontSize: 40,fontWeight: FontWeight.bold),),

        MaterialButton(
          onPressed: _btn_timer,
          color: Colors.red,
          child: Text("Timer",style:GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20),),
        ),

        MaterialButton(onPressed: _load_reset,
        color: Colors.deepPurpleAccent,
        child: Text("Reset",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),)

      ],

    );
  }


}
