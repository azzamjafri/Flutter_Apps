import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
//  num heightInch;
  double heightInch = 0.0;
  double bmi = 0.0;

//  String finalBMI = "";
  String index = "";

  void calculateBMI() {

    heightInch = double.parse(_heightController.text)*0.394;

    setState(() {

      bmi = (703*double.parse(_weightController.text))/pow(double.parse(_heightController.text), 2);

      if(bmi < 18.5){
        index = "Under Weight";
      }
      else if(bmi >= 18.5 && bmi < 25)
        index = "Normal";
      else if(bmi >= 25 && bmi < 30)
        index = "Over Weight";
      else
        index = "Obese";


    });
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI", style: new TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),

      backgroundColor: Colors.white,

      body: new Container(
        alignment: Alignment.topCenter,

        child: new ListView(



          children: <Widget>[

            new Image.asset('images/bmilogo.png', height: 105, width: 110,),

            new Container(

              margin: const EdgeInsets.all(3.0),


              height: 245.0,
              width: 290.0,
              color: Colors.grey.shade300,

              child: new Column(



                children: <Widget>[


                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Age",
                      icon: new Icon(Icons.person)
                    ),
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(7.0)),

                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Height in cms",
                      icon: new Icon(Icons.assessment)
                    ),

                  ),
                  new Padding(padding: new EdgeInsets.all(7.0)),


                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: "Weight in lbs",
                      icon: new Icon(Icons.line_weight)
                    ),
                  ),

                  new Padding(padding: const EdgeInsets.all(5.0)),
                  new RaisedButton(
                    onPressed: calculateBMI,
                    color: Colors.pinkAccent,

                    child: new Text("Calculate",
                      style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 19.5, color: Colors.white),

                    ),

                  )

                ],
              ),
            ),
            
            new Container(
              child: new Column(
                children: <Widget>[
                  new Text("Your BMI - " + bmi.toStringAsFixed(2), style: new TextStyle(fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic
                  ),
                  ),
                  new Text(index, style: new TextStyle(fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightGreenAccent
                  ),)
                ],
              ),
            )




            
          ],
        ),
      ),

    );
  }
}