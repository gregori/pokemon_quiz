import 'package:flutter/material.dart';
import 'package:pokemon_quiz/pokemon.dart';
import 'package:pokemon_quiz/quiz_details.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Pokemon'),
      ),
      body: FutureBuilder<PokemonList>(
        future: fetchPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text('Um erro ocorreu!'),
            );
          } else if (snapshot.hasData) {
            return QuizDetails(pokemonList: snapshot.data!);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
