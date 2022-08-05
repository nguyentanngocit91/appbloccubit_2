import 'package:flutter/material.dart';
class Ex_SecondScreen extends StatelessWidget{
  final List _list_post=[
    "Arr1",
    "ARR2",
    "ARR3",
    "ARR4",
    "arr5",
    "arr5",
    "arr5",
    "arr5",
    "arr5",
    "arr5",
  ];

  Widget build (BuildContext context){
    return Column(

      children: [


        Expanded(

            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _list_post.length,
              itemBuilder: (context, index) => Draw_Circle(),)
        ),

        Expanded(

          child: ListView.builder(
            itemBuilder: (context, index) => Box_ItemsSquare(
            child: _list_post[index],
            ),

            itemCount: _list_post.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),

        ),
      ],

       /* child: ListView.builder(
          itemCount: _list_post.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Box_ItemsSquare(),
        ),*/

        /*ListView(

          children: [

            Box_ItemsSquare(),

            Padding(padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text("Số 2",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),),
              ),
            ),

            Padding(padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                color: Colors.blue,
              ),
            ),



            Padding(padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                color: Colors.blue,
                child: Text("Số 2"),
              ),
            ),


            Padding(padding: EdgeInsets.all(10),
              child: Container(
                height: 150,
                color: Colors.blue,
                child: Text("Số 2"),
              ),
            ),



          ],

        ),*/


    );
  }
}

class Box_ItemsSquare extends StatelessWidget{
  late final String child;

  Box_ItemsSquare({required this.child});

  Widget build (BuildContext context){

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed("/PageNews_quare"),
      child: Padding(padding: EdgeInsets.all(10),
        child: Container(
          height: 150,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("Số 2",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),),
        ),
      ),
      
    ); 
  }
}

class Draw_Circle extends StatelessWidget{
  Widget build (BuildContext context){
    return Padding(padding: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: Text("A",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,letterSpacing: 0.5),),
      ),
    );
  }
}