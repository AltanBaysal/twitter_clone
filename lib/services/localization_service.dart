import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:twitter/core/functions/global_key.dart';

/// Lazy Singleton example
class LocalizationService {
  static LocalizationService? _instance;

  static LocalizationService of() {
    _instance ??= LocalizationService();
    return _instance!;
  }

  AppLocalizations get getLocale => AppLocalizations.of(
        GlobalContextKey.instance.globalKey.currentContext!,
      )!;
}
