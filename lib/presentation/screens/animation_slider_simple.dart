
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Animation_Controller_Slide_Simple extends StatefulWidget{
  Animation_Controller_Slide_Simple({Key?key}):super(key: key);
  @override
  State<Animation_Controller_Slide_Simple> createState() => _Animation_Controller_Slide_SimpleState();
}

class _Animation_Controller_Slide_SimpleState extends State<Animation_Controller_Slide_Simple> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late double _currentValue= 0;

  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
  }

  bool IconPlaying=false;
  void _iconTapped(){
    if (IconPlaying==false){

      _animationController.forward();
      IconPlaying=true;

    }else{

      _animationController.reverse();
      IconPlaying=false;
    }

  }

  late DateTime _dateTime= DateTime.now();
  void _showDateTime (){
    showDatePicker(
        context: context,
        fieldLabelText: "Chọn ngày",
        confirmText: "ok ok",
        cancelText: " no no",
        fieldHintText: "menu aaa",
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    ).then((value) =>
    setState((){
      _dateTime=value!;
    })

    );
  }

   TimeOfDay _timeOfDay=TimeOfDay(hour: 8, minute: 30);
  void _showTimePicker(){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),

    ).then((value) =>
    setState((){
      _timeOfDay=value!;
    })

    );
  }

  @override

  Widget build (BuildContext context){
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            /* onTap: () => {
                _animationController.forward(),
              },*/
            onTap: _iconTapped,
            child: AnimatedIcon(
              icon: AnimatedIcons.pause_play,
              progress: _animationController,
              size: 150,
              color: Colors.red,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("LOAD COUNT :${_currentValue.toString()}",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold),),

              Slider(
                min: 0,
                max: 10,
                divisions: 14,
                activeColor: Colors.red,
                label: "Hello Kitty ${_currentValue.toString()}",
                thumbColor: Colors.deepPurpleAccent,
                value: _currentValue,
                autofocus: false,
                inactiveColor: Colors.amberAccent,
                onChangeStart: (startValue){

                },
                onChanged: (newValue){
                  setState((){
                    _currentValue=newValue;
                  });
                },
              ),


              Text("Show date:${_dateTime.day.toString()}",style: GoogleFonts.roboto(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),),

              MaterialButton(
                padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                color: Colors.deepPurple,
                  onPressed: _showDateTime

                ,child: Text("Chọn Ngày",style: GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),),



              Padding(padding: EdgeInsets.all(25)),

              Text("Show TimePicker:${_timeOfDay.format(context).toString()}",style: GoogleFonts.roboto(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
              Padding(padding: EdgeInsets.all(15)),
              MaterialButton(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(15),
                onPressed: _showTimePicker,
                child: Text("Button Time Picker",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
              )


            ],
          ),









        ],
      ),
    );
  }
}