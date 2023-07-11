import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListTile(
        leading: const Icon(Icons.lightbulb),
        title: const Text('Dark/Light Mode'),
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ThemeModeSelectionPage(),
          )),
        },
      ),
    ]);
  }
}


class ThemeModeSelectionPage extends StatelessWidget {
  const ThemeModeSelectionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('Light'),
            onTap: () => {
              Navigator.of(context).pop(),
              ThemeModeManager.of(context).setThemeMode(ThemeMode.light) ,
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('Dark'),
            onTap: () => {
              Navigator.of(context).pop(),
              ThemeModeManager.of(context).setThemeMode(ThemeMode.dark),
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('System'),
            onTap: () => {
              Navigator.of(context).pop(),
              ThemeModeManager.of(context).setThemeMode(ThemeMode.system),
            },
          ),
        ],
      ),
    );
  }
}

class ThemeModeManager extends StatefulWidget {
  const ThemeModeManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _ThemeModeManagerState createState() => _ThemeModeManagerState(); 
  static _ThemeModeManagerState of(BuildContext context) {
    final _ThemeModeManagerState? result = context.findAncestorStateOfType<_ThemeModeManagerState>();
    assert(result != null, 'No ThemeModeManager found in context');
    return result!;
  }
}

class _ThemeModeManagerState extends State<ThemeModeManager> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}