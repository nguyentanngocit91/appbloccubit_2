
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Animation_Controller_Slide_Simple extends StatefulWidget{
  Animation_Controller_Slide_Simple({Key?key}):super(key: key);
  @override
  State<Animation_Controller_Slide_Simple> createState() => _Animation_Controller_Slide_SimpleState();
}

class _Animation_Controller_Slide_SimpleState extends State<Animation_Controller_Slide_Simple> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late double _currentValue= 0;
  
  late DateTime _currentDate=DateTime(18);

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


  late PageController _pagecontroller = PageController();


  @override

  Widget build (BuildContext context){
    return Scaffold(

      body: SingleChildScrollView(
        controller: ScrollController(),
       scrollDirection: Axis.vertical,
        child: Column(
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


        Padding(padding: EdgeInsets.all(20)),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 1000,
                  radius: 100,
                  lineWidth: 20,
                  backgroundColor: Colors.lightBlueAccent,
                  progressColor: Colors.amberAccent,
                  center:Icon(Icons.home) ,
                  header: Text("40%",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  fillColor: Colors.red,
                  percent: 0.4,
                  circularStrokeCap: CircularStrokeCap.round,
                  restartAnimation: true,
                  startAngle: 0.4,

                ),

                Padding(padding: EdgeInsets.all(10)),
                LinearPercentIndicator(
                  backgroundColor: Colors.deepPurple,
                  progressColor: Colors.deepOrange,
                  percent: 0.5,
                  lineHeight: 50,
                  padding: EdgeInsets.all(10),
                  animation: true,
                  animationDuration: 1000,
                  barRadius: Radius.circular(15),
                  center: Text("50%",style: GoogleFonts.roboto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyanAccent),),
                )


              ],
            ),
          ),


          Container(
            width: double.infinity,
            height: 500,
            child: CarouselSlider(
              scrollDirection: Axis.horizontal,
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.all(15),
                currentIndicatorColor: Colors.red,
              ),
              slideTransform: CubeTransform(),
              unlimitedMode: true,
              children: [

                Container(
                  color: Colors.deepOrange,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.deepPurple,
                ),

                Container(
                  color: Colors.amber,
                ),

              ],
            ),

          ),

          Padding(padding: EdgeInsets.all(15)),

          Container(
            margin:EdgeInsets.all(15),
            child: CalendarCarousel(
              width: double.infinity,
              height: 400,
              isScrollable: true,
              scrollDirection: Axis.horizontal,
              dayButtonColor: Colors.deepOrangeAccent,
              iconColor: Colors.blue,
              dayCrossAxisAlignment: CrossAxisAlignment.center,
              selectedDayButtonColor: Colors.black,
              onDayPressed: (DateTime date, List<Event> events){

                this.setState(() {

                  _currentDate=date;

                });

              },

              weekDayBackgroundColor: Colors.deepPurple,
              thisMonthDayBorderColor: Colors.amber,

            ),
          ) ,



            Padding(padding: EdgeInsets.all(15)),

            Container(
              width: double.infinity,
              height: 500,

              child:   PageView(
                scrollDirection: Axis.horizontal,
                controller: _pagecontroller,

                children: [

                  Page_View1(),
                  Page_View2(),
                  Page_View3(),


                ],
              ),

            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: SmoothPageIndicator(

                    axisDirection: Axis.horizontal,
                    controller: _pagecontroller,
                    count: 3,

                    effect: JumpingDotEffect(
                      activeDotColor: Colors.purple,
                      dotColor: Colors.deepOrangeAccent,
                      dotHeight: 30,
                      dotWidth: 30,
                    ),
                  ) ,
                )





              ],
            ),





          ],
        ),
      ),
    );
  }
}

class Page_View1 extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Padding(

          padding:EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.blue,
        ),
      ),
      ),
    );
  }
}

class Page_View2 extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Padding(

        padding:EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

class Page_View3 extends StatelessWidget{
  Widget build (BuildContext context){
    return Scaffold(

      backgroundColor: Colors.transparent,
      body: Padding(

        padding:EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}