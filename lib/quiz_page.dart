import 'package:flutter/material.dart';
import 'package:pokemon_quiz/pokemon.dart';

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

class QuizDetails extends StatelessWidget {
  QuizDetails({required this.pokemonList});

  final PokemonList pokemonList;

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
              image: pokemonList.pokemon[2].imgUrl,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(pokemonList.pokemon[2].name),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Pikachu'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Pikachu'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Pikachu'),
            ),
          ),
        ),
      ],
    );
  }
}
