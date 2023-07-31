import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
    _themeMode = themeMode;
    notifyListeners();
  }

  Future<void> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('themeMode') ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }
}

class ThemeModeManager {
  static Widget getApp(Widget app) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, themeModeProvider, child) {
        return MaterialApp(
          themeMode: themeModeProvider.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          home: app,
        );
      },
    );
  }

  static ThemeMode getCurrentSystemThemeMode() {
    final brightness = WidgetsBinding.instance!.window.platformBrightness;
    if (brightness == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  static void setThemeMode(BuildContext context, ThemeMode themeMode) {
    final themeModeProvider =
        Provider.of<ThemeModeNotifier>(context, listen: false);
    themeModeProvider.setThemeMode(themeMode);
  }
}

class ThemeModeManagerWidget extends StatelessWidget {
  const ThemeModeManagerWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final themeModeProvider =
        Provider.of<ThemeModeNotifier>(context, listen: false);
    themeModeProvider.loadThemeMode();
    return ThemeModeManager.getApp(
      child,
    );
  }
}

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
              ThemeModeManager.setThemeMode(context, ThemeMode.light),
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('Dark'),
            onTap: () => {
              Navigator.of(context).pop(),
              ThemeModeManager.setThemeMode(context, ThemeMode.dark),
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text('System'),
            onTap: () => {
              Navigator.of(context).pop(),
              ThemeModeManager.setThemeMode(context, ThemeMode.system)
            },
          ),
        ],
      ),
    );
  }
}
