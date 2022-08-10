import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageView_Scroll_TikTok extends StatelessWidget{

  final _PageController=PageController();
  final List<Color> _Colors =[
    Colors.deepPurpleAccent,
    Colors.red,
    Colors.greenAccent,
    Colors.deepOrangeAccent
  ];
  Widget build (BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _PageController,
        scrollDirection: Axis.vertical,
        children: [
          MyPage(),
          MyPage2(),
          MyPage3(),


        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:1,
        ),
            itemCount: _Colors.length,

            itemBuilder:(context,index){
              return MyPage1(color: _Colors[index],);
            })
        ],
      ),
    );
  }
}

class MyPage1 extends StatelessWidget{
  late final Color color ;
  MyPage1({required this.color});

  Widget build (BuildContext context){

    return Scaffold(
    backgroundColor:color,
    );
  }
}

class MyPage extends StatelessWidget{


  Widget build (BuildContext context){

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
    );
  }
}


class MyPage2 extends StatelessWidget{


  Widget build (BuildContext context){

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
    );
  }
}

class MyPage3 extends StatelessWidget{


  Widget build (BuildContext context){

    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}