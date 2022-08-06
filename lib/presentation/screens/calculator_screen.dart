import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget{
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState ();

}
class _CalculatorState extends State<Calculator> {

  var userQuestion="";
  var userAnswer="";
  final List<String> Buttons= [
    'AC','DEL','%','/',
    '9','8','7','x',
    '6','5','4','-',
    '3','2','1','+',
    '0','.','ANS','=',
  ];
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Máy Tính Của Tân",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 18),),
        backgroundColor: Colors.cyanAccent,
        leading: IconButton(
          color: Colors.black,
          onPressed: ()=>{
            Navigator.of(context).pushNamed("/"),
          },
         icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(userAnswer,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),)),
                ],
              ),
            ),
          )),

          Expanded(
              flex: 2,
              child: Container(
            child: Center(

             // child: MyButtons(Color: Colors.deepPurple, textColor: Colors.white, buttonText: "0"),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: Buttons.length,
                itemBuilder: (context,index) {
                  if (index == 0 ) {
                    return MyButtons
                      (
                      buttonTapped: (){

                        setState(() {
                          userQuestion="0";
                          userAnswer="0";
                        },);

                      },
                        Color: isOperator(Buttons[index])
                            ? Colors.deepPurple
                            : Colors.red,
                        textColor: isOperator(Buttons[index])
                            ? Colors.white
                            : Colors.white,
                        buttonText: Buttons[index]
                    );
                  }
                  else if (index==1){

                    return MyButtons
                      (
                        buttonTapped: (){
                          setState((){
                            userQuestion=userQuestion.substring(0,userQuestion.length-1);
                          });

                        },
                        Color: isOperator(Buttons[index])
                            ? Colors.deepPurple
                            : Colors.red,
                        textColor: isOperator(Buttons[index])
                            ? Colors.white
                            : Colors.white,
                        buttonText: Buttons[index]
                    );

                  }
                  else if (index==Buttons.length-1){

                    //print('${index} + ${Buttons.length}');

                    return MyButtons
                      (
                        buttonTapped: (){
                          setState((){
                           // userQuestion=userQuestion.substring(0,userQuestion.length-1);
                            equalPressed();
                          });

                        },
                        Color: isOperator(Buttons[index])
                            ? Colors.deepPurple
                            : Colors.red,
                        textColor: isOperator(Buttons[index])
                            ? Colors.white
                            : Colors.white,
                        buttonText: Buttons[index]
                    );

                  }
                  else {

                    return MyButtons
                      (
                      buttonTapped: (){

                       setState( () {
                        userQuestion+=Buttons[index];
                       });
                      },
                        Color: isOperator(Buttons[index])
                            ? Colors.deepPurple
                            : Colors.white,
                        textColor: isOperator(Buttons[index])
                            ? Colors.white
                            : Colors.black87,
                        buttonText: Buttons[index]
                    );

                  }
                }

            ),
            ),

          )),

        ],

      ),

    );
  }

  bool isOperator(String x){

    if (x=='%' || x=='/' || x=='x' || x=='-' || x=='+' || x=='=' || x=='.' || x=='ANS'){
      return true;
    }
    else{
      return false;
    }

  }


  void equalPressed(){
    String finalQuestion=userQuestion;
    finalQuestion=finalQuestion.replaceAll("x", "*");
   // print(finalQuestion);
    Parser parser=Parser();
    Expression expression=parser.parse(finalQuestion);
    ContextModel contextModel=ContextModel();
    double eval=expression.evaluate(EvaluationType.REAL,contextModel);
    userAnswer=eval.toString();

  }



}


class MyButtons extends StatelessWidget{
  late final  Color;
  late final textColor;
  late final String  buttonText;
  final buttonTapped;

  MyButtons({required this.Color, required this.textColor, required this.buttonText,required this.buttonTapped});

  Widget build (BuildContext context){
    return GestureDetector(
      onTap: buttonTapped,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Color,
              child: Center(
                child: Text(buttonText,style: TextStyle(color: textColor,fontSize: 20),),
              ),
            ),
          ),
        ),
    );
  }
}