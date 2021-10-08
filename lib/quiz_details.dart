import 'package:flutter/material.dart';
import 'package:pokemon_quiz/pokemon.dart';

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
