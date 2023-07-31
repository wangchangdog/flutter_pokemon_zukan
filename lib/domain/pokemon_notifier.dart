import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/domain/fetch_pokemon.dart';
import 'package:flutter_pokemon_zukan/model/pokemon.dart';

class PokemonNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};
  
  // PokemonのリストをMapで取得
  Map<int, Pokemon?> get pokes => _pokeMap;

  // PokemonのリストをMapで更新する
  void addPoke(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  // idで指定されたポケモンをhttpで取得する
  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    addPoke(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    // idで指定されたポケモンが存在するかどうかを確認し、存在しない場合はfetchする
    if (!_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }
}
