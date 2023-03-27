// in main(),we need to execute some code which takes our widget here and draws it to the screen, for that we have function provided by
// material.dart called runApp(),its written by flutter team , hence import file unlocks a lot of cool features we need to build an app
// runApp() runs our flutter app, we need to tell runApp our core widget i.e. MyApp(), runApp takes the object MyApp() and calls build
// method for us
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();          
  }
}
// NOTE: Majority of widgets are StatelessWidget are mostly we want to output something in a nice way, but sometimes we need to change data, u need to react to user input & change something where we use StatefulWidget
// this State belongs to MyApp class
// to inform dart that MyAppState class should only be usable from inside the main.dart file,add _ i.e. _MyAppState,it turns public class(i.e. it can be used in any file which imports main.dart) to private class(only be used inside main.dart file,if any other file imports main.dart file it won't b able to use this class)
class _MyAppState extends State<MyApp>{
  var _questionIndex = 0; // questionIndex is a private property

  void _answerQuestion(){
    // setState() is a function provided by state class , and it takes a anonymous fn() 
    // setState() is a fn() that forces flutter to re-render user-interface, setState() calls build again of the widget where u call setState
    // flutter goes through the build() again but not re-render entire ui again i.e. it doesn't redraw every pixel again
    setState(() {
    _questionIndex++;         // whenever this fn gets called questionIndex increases by 1  
    });
    
    print(_questionIndex);
  }
  @override 

  Widget build(BuildContext context){
    var questions = [
      'What\'s your favorite car?',
      'What\'s your favorite animal?', 
      'Who is your inspiration?',
    ];

    return MaterialApp(home: Scaffold(
        appBar: AppBar(
          title: Text('My first app!'),
        ), 

        // since in body we can't use more than 1 widget,we use Column widget,it has children arg which takes list of widgets
        body: Column(children: [
          Question(questions[_questionIndex]),            // OR questions.elementAt(0)

          // when we press the fn() should get executed but here error came under answerQuestion() because it is a void fn() return nothing
//here we're passing return value of fn() to onPressed,i.e. by adding () to fn it gets executed when dart tries to build the button but we want to execute this fn() when user presses the button
// but if we remove () i.e. answerQuestion ,we're passing a pointer at that function to flutter to onPressed,so it executes it when user presses button
            // ElevatedButton(
            //   child: Text('Answer 1'),
            //   onPressed: _answerQuestion,
            // ),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
        ],
        ),
    ),
    );
  }
}

// adding a new class as we want to create a new widget








