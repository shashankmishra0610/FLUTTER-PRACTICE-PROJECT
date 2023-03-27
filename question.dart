import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  
  // receives some input data
  Question(this.questionText);       // now the first argument passed to Question constructor will be stored in questionText property

  @override
  Widget build(BuildContext context) {
    // Container takes full width(double.infinity) of screen and Text takes full width of Container 
    return Container(
      width: double.infinity,            // .infinity gives u width that ensures container takes as much size & width as it can get
      margin: EdgeInsets.all(10),
      child: Text(
      questionText,
      style: TextStyle(fontSize: 28),         // this makes fontsize 28 pixels
      textAlign: TextAlign.center,           // to center the text
    ),);
  }
}