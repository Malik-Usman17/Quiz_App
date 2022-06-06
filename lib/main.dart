import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  // List<Icon> scoreKeeper = [
  //   const Icon(
  //     Icons.check,
  //     color: Colors.green,
  //   ),
  //   const Icon(
  //     Icons.close,
  //     color: Colors.red,
  //   )
  // ];

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer){

    bool correctAnswer = quizBrain.getCorrectAnswer();

    if(correctAnswer == userPickedAnswer){
      print('user got it right.');
    } else{
      print('user got it wrong.');
    }
    setState((){
      quizBrain.nextQuestion();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //quizBrain.questionBank[questionNumber].questionText,
                //quizBrain.getQuestionText(questionNumber),
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                //quizBrain.questionBank[questionNumber].questionAnswer = true; now we cannot set the value here
                //bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                //bool correctAnswer = quizBrain.getCorrectAnswer(questionNumber);
                checkAnswer(true);

                // setState((){
                //   scoreKeeper.add(
                //       const Icon(Icons.check, color: Colors.green,)
                //   );
                // });

              },
              child: const Text('True',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white)
                  ),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text('False',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
        ),
        //TODO: Add a row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
