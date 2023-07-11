import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/poke_list_item.dart';
import 'package:flutter_pokemon_zukan/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Pokemon Zukan',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  TopPage({Key? key}) : super(key: key);
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentbnb = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: currentbnb,
            children: const [
              PokeList(),
              Settings(),
              Info(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {
            setState(
              () => currentbnb = index,
            )
          },
          currentIndex: currentbnb,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
        ));
  }
}

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      itemCount: 1010,
      itemBuilder: (context, index) => PokeListItem(index: index),
    );
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      ListTile(
        leading: Icon(Icons.info),
        title: Text('About'),
      ),
    ]);
  }
}
