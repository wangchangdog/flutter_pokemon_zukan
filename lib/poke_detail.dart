import 'package:flutter/material.dart';

class PokeDetail extends StatelessWidget {
  PokeDetail({Key? key, required this.title});
  final String title;
  
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
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: const Text(
                      "オムナイト",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
                Chip(
                  backgroundColor: Colors.cyan,
                  label: Text(
                    "みず",
                    style: TextStyle(
                        color: Colors.cyan.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white
                        ),
                  ),
                ),
              ])),
    );
  }
}
