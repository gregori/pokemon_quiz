import 'dart:math';

import 'package:pokemon_quiz/pokemon.dart';

class QuizBrain {
  QuizBrain({required this.pokemonList});

  final PokemonList pokemonList;
  final _random = Random();
  int _currentPokemon = 0;
  int _correctOptionIndex = 0;

  int _getRandomPokemonIndex() {
    return _random.nextInt(pokemonList.pokemon.length);
  }

  void nextPokemon() {
    // escolhe um pokemon aleatório (pega um inteiro entre 0 e o tamanho da lista)
    _currentPokemon = _getRandomPokemonIndex();
    // obtém a posição da resposta correta (um número entre 0 e 4)
    _correctOptionIndex = _random.nextInt(4);
  }

  String getCurrentPokemonImgUrl() {
    return pokemonList.pokemon[_currentPokemon].imgUrl;
  }

  List<String> getPokemonNamOptions() {
    String correctPokemonName = pokemonList.pokemon[_currentPokemon].name;
    List<String> answers = [];
    String incorrectPokemonName;

    for (int i = 0; i < 4; i++) {
      if (i == _correctOptionIndex) {
        answers.add(correctPokemonName);
      } else {
        do {
          incorrectPokemonName =
              pokemonList.pokemon[_getRandomPokemonIndex()].name;
        } while (incorrectPokemonName == correctPokemonName);
        answers.add(incorrectPokemonName);
      }
    }

    return answers;
  }

  bool isCorrect(int answer) {
    return answer == _correctOptionIndex;
  }
}
