import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/constant/pokemon_types.dart';
import 'package:flutter_pokemon_zukan/model/pokemon.dart';
import 'package:flutter_pokemon_zukan/poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.poke}) : super(key: key);
  final Pokemon? poke;
  @override
  Widget build(BuildContext context) {
    // pokeがnullでない場合は、リストアイテムを表示する
    if (poke != null) {
      return ListTile(
          leading: Container(
              width: 80,
              decoration: BoxDecoration(
                color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])
                    ?.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      poke!.imageUrl,
                    )),
              )),
          title: Text(
            poke!.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          subtitle: Wrap(
            spacing: 8,
            children: <Widget>[
              ...poke!.types.map((type) {
                return Chip(
                  backgroundColor: pokeTypeColors[type],
                  label: Text(
                    type,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
          trailing: const Icon(Icons.navigate_next),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PokeDetail(poke: poke),
              ),
            );
          });
    }

    return const ListTile(
      title: Text("..."),
    );
  }
}
