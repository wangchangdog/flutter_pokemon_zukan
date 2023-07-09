import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png")),
            )),
        title: const Text(
          "オムナイト",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: const Text(
          "みず",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => PokeDetail(title: 'オムナイト'),
            ),
          );
        });
  }
}
