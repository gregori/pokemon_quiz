import 'package:flutter/material.dart';
import 'package:pokemon_quiz/pokemon.dart';
import 'package:pokemon_quiz/quiz_brain.dart';

class QuizDetails extends StatefulWidget {
  QuizDetails({required this.pokemonList});

  final PokemonList pokemonList;

  @override
  _QuizDetailsState createState() => _QuizDetailsState();
}

class _QuizDetailsState extends State<QuizDetails> {
  QuizBrain? quizBrain;
  List<String> namesList = [];

  @override
  void initState() {
    super.initState();
    quizBrain = QuizBrain(pokemonList: widget.pokemonList);
    updatePokemonData();
  }

  void updatePokemonData() {
    setState(() {
      quizBrain!.nextPokemon(); // obtém um pokemon aleatório
      namesList =
          quizBrain!.getPokemonNameOptions(); // obtém 4 nomes de pokemon
    });
  }

  void checkAnswer(int answer) {
    String message =
        quizBrain!.isCorrect(answer) ? 'Resposta correta!' : 'Resposta errada!';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    updatePokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'images/placeholder-image.png',
              image: quizBrain!.getCurrentPokemonImgUrl(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(0);
              },
              child: Text(namesList[0]),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(1);
              },
              child: Text(namesList[1]),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(2);
              },
              child: Text(namesList[2]),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                checkAnswer(3);
              },
              child: Text(namesList[3]),
            ),
          ),
        ),
      ],
    );
  }
}
