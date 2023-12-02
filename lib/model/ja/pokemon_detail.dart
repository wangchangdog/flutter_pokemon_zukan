class PokemonDetail {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> types;
  final List<String> abilities;
  final List<String> evolutions;

  PokemonDetail({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.types,
    required this.abilities,
    required this.evolutions,
  });

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    final List<String> types = [];
    final List<String> abilities = [];
    final List<String> evolutions = [];

    json['types'].forEach((type) {
      types.add(type['name']);
    });

    json['abilities'].forEach((ability) {
      abilities.add(ability['name']);
    });

    json['evolutions'].forEach((evolution) {
      evolutions.add(evolution['name']);
    });

    return PokemonDetail(
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      types: types,
      abilities: abilities,
      evolutions: evolutions,
    );
  }
}

