import 'package:flutter/material.dart';

class TabBar_Screen extends StatelessWidget{
  Widget build (BuildContext context){
    return DefaultTabController(
    length: 6,
      child:Scaffold(
        appBar: AppBar(title: Text("TAB BAR")),
        body: Column(
      children: [
      TabBar(
        isScrollable: true,
          tabs: [

            Tab(icon:Icon(Icons.home,color: Colors.blue),),
            Tab(icon: Icon(Icons.settings,color: Colors.deepPurple,),),
            Tab(icon: Icon(Icons.account_balance,color: Colors.amberAccent,),),
            Tab(icon:Icon(Icons.home,color: Colors.blue),),
            Tab(icon: Icon(Icons.settings,color: Colors.deepPurple,),),
            Tab(icon: Icon(Icons.account_balance,color: Colors.amberAccent,),),

          ]

      ),
        Expanded(child: TabBarView(children: [

          Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: Text("Màn hình Home",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,decoration: TextDecoration.none,fontSize: 18)),
          ),

          Container(color: Colors.white,
            alignment: Alignment.center,
            child: Text("Màn hình Setting",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 18,fontWeight: FontWeight.w900,decoration: TextDecoration.none),),
          ),
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Màn hình 3",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,decoration: TextDecoration.none,),),

          ),


          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Màn hình 3",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,decoration: TextDecoration.none,),),

          ),

          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Màn hình 3",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,decoration: TextDecoration.none,),),

          ),

          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Màn hình 3",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 18,decoration: TextDecoration.none,),),

          ),


        ]),


        ),

      ],
    ),
      ),

      
    );

  }
}