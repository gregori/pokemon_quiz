import 'dart:convert';

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
