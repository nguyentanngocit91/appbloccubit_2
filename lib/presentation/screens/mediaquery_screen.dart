import 'package:flutter/material.dart';

class MediaQueryScreen extends StatelessWidget{
  Widget build (BuildContext context){
    return Container(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Width:"+ MediaQuery.of(context).size.width.toString(),),

          Text("Height:"+MediaQuery.of(context).size.height.toString()),
          
          Text("Orientation :"+MediaQuery.of(context).orientation.toString()),

          Text("AspectRatio : "+MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)),

        ],
      ),
      
    );
  }
}