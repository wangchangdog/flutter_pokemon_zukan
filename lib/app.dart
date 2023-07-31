import 'package:flutter/material.dart';
import 'package:flutter_pokemon_zukan/view/page/poke_list.dart';
import 'package:flutter_pokemon_zukan/view/page/settings.dart';

class App extends StatelessWidget {
  App({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode mode = ThemeMode.system;
    return MaterialApp(
      title: 'Pokemon Zukan',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: mode,
      home: ThemeModeManagerWidget(
        child: TopPage(),
      ),
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
            children: [
              PokeList(),
              const Settings(),
              const Info(),
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

// 仮で作ったInfoページ
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
