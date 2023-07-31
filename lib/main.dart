import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/app.dart';
import 'package:flutter_pokemon_zukan/view/component/poke_list_item.dart';
import 'package:flutter_pokemon_zukan/view/page/settings.dart';
import 'package:flutter_pokemon_zukan/domain/pokemon_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier();
  final pokemonNotifier = PokemonNotifier();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeModeNotifier>(
        create: (context) => themeModeNotifier,
      ),
      ChangeNotifierProvider<PokemonNotifier>(
        create: (context) => pokemonNotifier,
      )
    ],
    child: App(),)
  );
}

