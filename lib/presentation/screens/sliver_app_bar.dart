import 'package:flutter/material.dart';

class SliverAppBar_View extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            backgroundColor: Colors.cyanAccent,
            title: Text("Start On Sliver App Bar"),
            leading: Icon(Icons.arrow_back),
            elevation: 100,
            collapsedHeight: 100,
            expandedHeight: 100,
          ),

          Expanded(
            child:GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,),
              itemCount: 20,
              itemBuilder:(context,index) {
                return Items_Sliver();
              }
          ),


          ),




        ],
      ),
    );
  }
}


class Items_Sliver extends StatelessWidget{
  Widget build (BuildContext context){

    return Column(

      children: [

        SliverToBoxAdapter(
          child: Container(
            color: Colors.blue,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text("Hi Data",style: TextStyle(color: Colors.black,fontSize: 20,decoration: TextDecoration.none),),
          ),
        ),

      ],
    );

  }
}