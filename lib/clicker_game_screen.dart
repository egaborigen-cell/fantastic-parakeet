
import 'package:flutter/material.dart';
import 'package:myapp/alert_service.dart';
import 'package:myapp/l10n/app_localizations.dart';

class ClickerGameScreen extends StatefulWidget {
  const ClickerGameScreen({super.key});

  @override
  State<ClickerGameScreen> createState() => _ClickerGameScreenState();
}

class _ClickerGameScreenState extends State<ClickerGameScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _submitScore() {
    submitScore(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.clickerGame),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.youHavePushedTheButtonThisManyTimes,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitScore,
              child: Text(AppLocalizations.of(context)!.submitScore),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: AppLocalizations.of(context)!.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
