import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/constant/pokemon_types.dart';
import 'package:flutter_pokemon_zukan/model/pokemon.dart';

class PokeDetail extends StatelessWidget {
  const PokeDetail({Key? key, required this.poke}) : super(key: key);
  final Pokemon? poke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(children: [
                  Container(
                    padding: EdgeInsets.all(32),
                    child: Image.network(
                      poke!.imageUrl,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      poke!.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ])),
    );
  }
}
