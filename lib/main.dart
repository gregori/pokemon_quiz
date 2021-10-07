import 'package:flutter/material.dart';
import 'package:pokemon_quiz/quiz_page.dart';

void main() {
  runApp(PokemonQuiz());
}

class PokemonQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}
