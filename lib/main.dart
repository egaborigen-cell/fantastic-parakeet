import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/alert_service.dart';
import 'package:myapp/leaderboard_screen.dart';
import 'package:myapp/clicker_game_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/l10n/app_localizations.dart';

void main() {
  if (kIsWeb) {
    initYandexGames();
    getEnvironmentLanguage();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Chalkduster',
      ),
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      home: const MyHomePage(title: 'Flutter JS Interop Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _playerName = "";
  String _environmentLanguage = "";

  void _showPlayerName() {
    setState(() {
      _playerName = getPlayerName();
    });
  }

  void _getEnvironmentLanguage() {
    setState(() {
      _environmentLanguage = getEnvironmentLanguage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.flutterDemo),
        actions: [
          TextButton(
            onPressed: _showPlayerName,
            child: Text(
              AppLocalizations.of(context)!.showPlayerName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_playerName, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(_environmentLanguage, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getEnvironmentLanguage,
              child: Text(AppLocalizations.of(context)!.getLanguage),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final myAppState = MyApp.of(context);
                final currentLocale = Localizations.localeOf(context);
                if (currentLocale.languageCode == 'en') {
                  myAppState?.changeLocale(const Locale('ru'));
                } else {
                  myAppState?.changeLocale(const Locale('en'));
                }
              },
              child: const Text('Toggle Locale'),
            ),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.pressTheButtonToCallAJavaScriptFunction),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClickerGameScreen(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.playClickerGame),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LeaderboardScreen(),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.showLeaderboard),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlert(AppLocalizations.of(context)!.helloFromFlutter),
        tooltip: AppLocalizations.of(context)!.increment,
        child: const Icon(Icons.smart_button),
      ),
    );
  }
}
