import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Lazy Singleton example
class LocalizationService {
  static LocalizationService? _instance;
  late AppLocalizations _locale;

  LocalizationService(BuildContext context) {
    _locale = AppLocalizations.of(context)!;
  }

  LocalizationService of(BuildContext context) {
    _instance ??= LocalizationService(context);
    return _instance!;
  }

  AppLocalizations get getLocale => _locale;
}
