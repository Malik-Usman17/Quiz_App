import 'package:flutter/material.dart';

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

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  List<bool> answers = [
    false,
    true,
    true
  ];

  int questionNumber = 0;

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
                questions[questionNumber],
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

                bool correctAnswer = answers[questionNumber];

                if(correctAnswer == true){
                  print('user got it right.');
                } else{
                  print('user got it wrong.');
                }
                setState((){
                  questionNumber++;
                });
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
                bool correctAnswer = answers[questionNumber];

                if(correctAnswer == false){
                  print('user got it right.');
                } else{
                  print('user got it wrong.');
                }

                setState(() => questionNumber++);
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
