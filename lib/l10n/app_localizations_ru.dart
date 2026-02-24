// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get playClickerGame => 'Играть в кликер';

  @override
  String get showLeaderboard => 'Показать таблицу лидеров';

  @override
  String get clickerGame => 'Кликер';

  @override
  String get youHavePushedTheButtonThisManyTimes =>
      'Вы нажали на кнопку столько раз:';

  @override
  String get increment => 'Увеличить';

  @override
  String get showPlayerName => 'Показать имя игрока';

  @override
  String get getLanguage => 'Получить язык';

  @override
  String get pressTheButtonToCallAJavaScriptFunction =>
      'Нажмите кнопку, чтобы вызвать функцию JavaScript.';

  @override
  String get helloFromFlutter => 'Привет из Flutter!';

  @override
  String get flutterDemo => 'Демонстрация Flutter';

  @override
  String get submitScore => 'Отправить счет';
}
