import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
//import './validate.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return QuizAppState();
  }
}

class QuizAppState extends State<QuizApp> {
  Color color = Colors.white;
  var ans = "";
  var score = 0;
  var status = "";

  var questions = [
    [
      'What is your Favourite Color',
      '1',
      ['red', 'yellow', 'green', 'pink'],
      'red',
      'none'
    ],
    [
      'What is Your Favourite Animal',
      '2',
      ['Lion', 'Tiger', 'Cheetah', 'All'],
      'All',
      'none'
    ],
    [
      'Who is Your Favourite Hero',
      '3',
      ['Dwayne Johnsons', 'Robert Downey jr', 'Johnny Depp', 'All'],
      'All',
      'none'
    ],
    [
      'Which is Your Favourite Phone',
      '4',
      ['Nokia 3310', 'Iphone 11', 'Oneplus', 'Iphone 12'],
      'Nokia 3310',
      'none'
    ]
  ];
  var questionIndex = 0;
  void Next() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  void Previous() {
    setState(() {
      questionIndex = questionIndex - 1;
    });
  }

  String answer = "None";
  answerValidate(answerof) {
    setState(() {
      if (answerof == questions[questionIndex][3]) {
        answer = "Correct";

        if (questions[questionIndex][4] == 'none') {
          score = score + 1;
          questions[questionIndex][4] = true;
        }
      if (score==questions.length){
        status = "You Are Awesome";
      }

      } else {
        answer = "Wrong";
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QuizApp'),
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child:
                    Text('Welcome To Quiz App', style: TextStyle(fontSize: 30)),
              ),
              Divider(
                color: Colors.black,
                height: 50,
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Question(
                        questions[questionIndex][(1)],
                        //style: TextStyle(fontSize: 30),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Question(
                          questions[questionIndex][0],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            for (var item in questions[questionIndex][2])
                              Container(
                                margin: EdgeInsets.all(10),
                                child: RaisedButton(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  color: Color(0XFF03A9F4),
                                  onPressed: () {
                                    // check if correct
                                    answerValidate(item);
                                  },
                                ),
                              ),
                            Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RaisedButton(
                                    child: Text('Previous',
                                        style: TextStyle(color: Colors.white)),
                                    color: Colors.amber[900],
                                    onPressed: () {
                                      setState(() {
                                        if (questionIndex > 0) {
                                          Previous();
                                          answer = "None";
                                        } else {
                                          questionIndex = 0;
                                        }
                                      });
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(5),
                                    child: RaisedButton(
                                      child: Text(
                                        'Next',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.amber[900],
                                      onPressed: () {
                                        setState(() {
                                          if (questionIndex <=
                                              ((questions.length) - 2)) {
                                            Next();
                                            answer = "None";
                                          } else {
                                            questionIndex = 0;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black)),
                                ),
                                child: Center(
                                    child: Container(
                                        child: Column(
                                  children: [
                                    Text(
                                      "Your answer is $answer",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Text(
                                      "Your Score is $score",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    Text(
                                      status,
                                      style: TextStyle(fontSize: 30,color:Colors.white,backgroundColor: Colors.green),
                                    ),
                                  ],
                                )
                                        //

                                        )

                                    //Column(children: [Text(questions[questionIndex][3])],),
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
