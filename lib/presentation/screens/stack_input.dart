import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Stack_Input_Post extends StatefulWidget{
  const Stack_Input_Post({Key? key}) : super(key: key);

  @override
  State<Stack_Input_Post> createState() => _Stack_Input_PostState ();

}
class _Stack_Input_PostState extends State<Stack_Input_Post> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
@override
  void initState(){
  super.initState();
  _animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));

  }

  bool VideoPlaying=false;

  void _iconTapped(){
      if (VideoPlaying==false){
        _animationController.forward();
        VideoPlaying=true;
      }else{
        _animationController.reverse(); // đảo ngược
        VideoPlaying=false;
      }
  }

  final _TextEditingController=TextEditingController();

 late var _loadPost= "Chưa có dữ liệu";

  Widget build(BuildContext context){
    return Scaffold(

      backgroundColor: Colors.green,


      body: Center(
        child: Stack(

          alignment: AlignmentDirectional.center,

          children: [

            Container(
              width: 300,
              height: 300,
              color: Colors.deepOrange,
            ),

            Container(
              width: 200,
              height: 200,
              color: Colors.greenAccent,
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.deepPurple,
            ),

            Padding(padding: EdgeInsets.only(top:100, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(_loadPost,style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),

                TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập liệu vào ngay",
                    border: OutlineInputBorder(),
                    suffixIcon:IconButton(onPressed: () => {
                      _TextEditingController.clear(),
                      setState((){
                       _loadPost="";
                       showDialog(context: context, builder: (BuildContext context)
                       {
                         return AlertDialog(
                           backgroundColor: Colors.red,
                           title: Text("Đã clear dữ liệu"),
                           alignment: Alignment.center,
                           actions: [
                             MaterialButton(

                               onPressed: () => {

                                 Navigator.of(context).pushNamed("/Stack_Input_Post"),

                             },
                             child: Text("Ok",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold),),),

                             MaterialButton(onPressed: () => {
                               Navigator.of(context).pop(),

                             },
                       child: Text("Cancel",style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold),),
                             ),

                           ],
                         );
                       } );
                      })
                    },
                    icon: Icon(Icons.clear)),
                  ),
                  controller: _TextEditingController,
                ),

                MaterialButton(

                  focusColor: Colors.cyanAccent,
                  onPressed: () => {
                    setState((){
                      _loadPost = _TextEditingController.text;
                    })
                },
                  color: Colors.cyanAccent,
                child: Text("Submit",style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),

                )

              ],
            ),
            ),

            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: GestureDetector(
                onTap: _iconTapped,
                child: AnimatedIcon(
                  icon:AnimatedIcons.pause_play,
                  progress: _animationController,
                  size: 150,
                  color: Colors.white,
                ),
              ),
            ),

          ],

        ),
      ),

    );
  }
}