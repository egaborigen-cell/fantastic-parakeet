import 'package:flutter/material.dart';
import 'package:myapp/alert_service.dart';

void main() {
  initYandexGames();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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

  void _showPlayerName() {
    setState(() {
      _playerName = getPlayerName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: _showPlayerName,
            child: const Text('Show Player Name', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_playerName, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const Text('Press the button to call a JavaScript function.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlert('Hello from Flutter!'),
        tooltip: 'Show Alert',
        child: const Icon(Icons.smart_button),
      ),
    );
  }
}
