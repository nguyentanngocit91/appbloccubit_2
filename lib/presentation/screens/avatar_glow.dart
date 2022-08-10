import 'package:appbloccubit/presentation/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';

class Avatar_Glow_Screen extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(

            child:Text("Avatar Glow",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold) )),
        leading: IconButton(
          onPressed: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Menu_Screen(),))
          },
        icon: Icon(Icons.menu),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.search),color: Colors.blue,),


        ],
      ),
     backgroundColor:Colors.blue,
      body:  Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,


        children: [


          RichText(text:
          TextSpan(
            style:GoogleFonts.ubuntu( fontWeight: FontWeight.bold,fontSize: 18),
              text: 'Kệ mạ nó',
          )),





          AvatarGlow(

            endRadius: 60.0,
            duration: Duration(milliseconds: 500),
            child: Material(     // Replace this child with your own
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'images/main-pic.png',
                  height: 150,
                ),
                radius: 30.0,
              ),
            ),
          ),

        ],

      ),
    );
  }
}