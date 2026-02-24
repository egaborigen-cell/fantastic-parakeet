import 'dart:js_interop';

void showAlert(String message) {
  // This is a stub implementation for non-web platforms.
  print('Alert (non-web): $message');
}

void initYandexGames() {
  // This is a stub implementation for non-web platforms.
  print('Yandex Games Initialized (non-web)');
}

String getPlayerName() {
  // This is a stub implementation for non-web platforms.
  return "Fake Player";
}

JSPromise<JSString?> getLeaderboard() {
  // This is a stub implementation for non-web platforms.
  throw UnimplementedError('getLeaderboard is not implemented on this platform.');
}

String getEnvironmentLanguage() {
  // This is a stub implementation for non-web platforms.
  return "en";
}

void submitScore(int score) {
  // This is a stub implementation for non-web platforms.
  print('Score submitted (non-web): $score');
}
