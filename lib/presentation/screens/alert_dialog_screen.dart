import 'dart:js';

import 'package:flutter/material.dart';

class AlertDialog_Screen extends StatefulWidget {
  @override
  State<AlertDialog_Screen> createState() => _AlertDialog_ScreenState();
  }

  class _AlertDialog_ScreenState extends State<AlertDialog_Screen> {

void _alertdialog(context){

    showDialog(context: context,barrierDismissible: false, builder: (BuildContext context){
      return AlertDialog(
        backgroundColor: Colors.deepOrange[100],
        title: Text("Alert Dialog"),
        content: Text("Content more info"),
        actions: [
          MaterialButton(onPressed: () => {

            Navigator.of(context).pushNamed("/"),
            
          },child: Text("Ok"),),
          
          MaterialButton(onPressed: () => {
            Navigator.of(context).pop(),
          },
          child: Text("Cancel"),)
        ],
      );

    });

  }
@override
  Widget build (BuildContext context){
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        TextButton(
          style:TextButton.styleFrom(backgroundColor: Colors.deepPurpleAccent,padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),primary: Colors.deepOrange,textStyle: TextStyle(fontSize: 18)) ,
            onPressed: () => _alertdialog(context), child: Text("Button Alert Dialog",style: TextStyle(decoration: TextDecoration.none,fontSize: 18,fontWeight: FontWeight.w900),))
      ],

    );
  }
}