import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

PokemonList pokemonListFromJson(String str) =>
    PokemonList.fromJson(json.decode(str));

class PokemonList {
  PokemonList({
    required this.pokemon,
  });

  List<Pokemon> pokemon;

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        pokemon:
            List<Pokemon>.from(json['pokemon'].map((x) => Pokemon.fromJson(x))),
      );
}

Future<PokemonList> fetchPokemons() async {
  final String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  final response = await http.get(Uri.parse(url));

  return compute(pokemonListFromJson, response.body);
}

class Pokemon {
  Pokemon({required this.id, required this.name, required this.imgUrl});

  final int id;
  final String name;
  final String imgUrl;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imgUrl: json['img'],
    );
  }
}
