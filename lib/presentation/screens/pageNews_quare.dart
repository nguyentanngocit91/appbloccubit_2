

import 'package:flutter/material.dart';

class PageNews_quare extends StatelessWidget{

  final List _arr_post=[
    "List 1",
    "List 2",
    "List 2",
    "List 2",
    "List 2",
    "List 2",
  ];

  Widget build (BuildContext context){
    return Column(
      children: [

        Expanded(
          
         /* child: ListView.builder(
          itemCount: _arr_post.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ListNews_Hot(child:_arr_post[index],),
        ),*/
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              crossAxisSpacing: 0.0,
                mainAxisSpacing: 10.0,
              ),
              addAutomaticKeepAlives: false,
              itemCount: _arr_post.length,
              itemBuilder: (context,index) =>(
              ListNews_Hot(child: _arr_post[index],)
              )),
          
        
        ),

        
        MaterialButton(
          onPressed: () => Navigator.of(context).pushNamed("/"),
          color: Colors.blue,
          child: Text("Quay Lai HOME",style: TextStyle(color: Colors.white,fontWeight:FontWeight.w900,decoration: TextDecoration.none),),
        )

      ],

    );
  }

}

class ListNews_Hot extends StatelessWidget{
  late final String child;
  ListNews_Hot({required this.child});

  Widget build (BuildContext context){
    return GestureDetector(
      onTap: ()=>{},
      child: Container(
        width: double.infinity,
        height: 200,
       margin:EdgeInsets.only(top: 20,bottom: 0),


       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [


           Container(
             alignment: Alignment.center,
             width: double.infinity,
             height: 150,
             decoration: BoxDecoration(
               color: Colors.black,
               border: Border.all(color: Colors.white),
               borderRadius: BorderRadius.all(Radius.circular(5)),
             ),


             child: Hero(
               tag: 'dash',
               transitionOnUserGestures: true,
               child:  Image.network("https://rainco.vn/thumbs/380x225x1/upload/news/nha-may-san-xuat-ong-tuoi-cay-ldpe-pe-rainco-3173.png"),

             )



           ),

           Padding(padding: EdgeInsets.all(10),
               child: Flexible(
                   child: Text("Nhà máy sản xuất ống tưới cây LDPE- PE Rainco",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 14, decoration: TextDecoration.none),))
           ),

         ],
       ),

      ),
    );
  }
}