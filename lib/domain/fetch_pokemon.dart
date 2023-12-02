import 'dart:convert';

import 'package:flutter_pokemon_zukan/constant/pokeapi.dart';
import 'package:flutter_pokemon_zukan/model/pokemon.dart';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int id) async {
  final res = await http.get(Uri.parse('$pokeApiRoute/pokemon/$id'));
  if (res.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(res.body));
  }
  if (res.statusCode == 404) {
    throw Exception('Request Pokemon is not found');
  }
  if (res.statusCode == 500) {
    throw Exception('Internal Server Error');
  }
  throw Exception('Failed to Load Pokemon (any other error)');
}

