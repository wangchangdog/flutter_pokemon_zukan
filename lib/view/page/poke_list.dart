import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/constant/pokeapi.dart';
import 'package:flutter_pokemon_zukan/domain/pokemon_notifier.dart';
import 'package:flutter_pokemon_zukan/view/component/poke_list_item.dart';
import 'package:provider/provider.dart';

class PokeList extends StatelessWidget {
  PokeList({Key? key}) : super(key: key);
  static const int more = 30;
  int pokeCount = pokeListFetchSize + more;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonNotifier>(
        builder: (context, pokes, child) => ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: pokeCount + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == pokeCount) {
                  return OutlinedButton(
                    onPressed: () {
                      pokeCount += more;
                      pokes.fetchPoke(pokeCount);
                    },
                    child: const Text("もっと見る"),
                  );
                }
                return PokeListItem(
                  poke: pokes.byId(index + 1),
                );
              },
            ));
  }
}
