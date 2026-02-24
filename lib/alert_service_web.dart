import 'dart:js_interop';

@JS('showAlert')
external void showAlert(String message);

@JS('initYandexGames')
external void initYandexGames();

@JS('getPlayerName')
external String getPlayerName();

@JS('getLeaderboard')
external JSPromise<JSString?> getLeaderboard();

@JS('getEnvironmentLanguage')
external String getEnvironmentLanguage();

@JS('setLeaderboardScore')
external void setLeaderboardScore(int score);

void submitScore(int score) {
  setLeaderboardScore(score);
}
