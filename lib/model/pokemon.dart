import 'dart:math';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imageUrl;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final List<String> types = json['types']
        .map((type) {
          return type['type']['name'];
        })
        .toList()
        .cast<String>();
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      types: types,
      imageUrl: json['sprites']['other']['official-artwork']['front_default']
          as String,
    );
  }
}