import 'dart:js_interop';

@JS('showAlert')
external void showAlert(String message);

@JS('initYandexGames')
external void initYandexGames();

@JS('getPlayerName')
external String getPlayerName();
