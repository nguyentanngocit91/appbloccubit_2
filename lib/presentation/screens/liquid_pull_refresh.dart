import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class Liquid_Pull_Refresh extends StatelessWidget{

  Future<void> _handRefresh() async{
   return await Future.delayed(Duration(seconds: 2));
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body: LiquidPullToRefresh(
        onRefresh: _handRefresh,
        height: 300,
        color: Colors.deepOrange,
        backgroundColor: Colors.green,
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 300,
                  color: Colors.blue,
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 300,
                  color: Colors.blue,
                ),
              ),
            ),


            Padding(padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 300,
                  color: Colors.blue,
                ),
              ),
            ),


          ],
        ) ,
      ),
    );
  }
}