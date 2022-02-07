import 'package:twitter/main.dart';
import 'package:twitter/services/localization_service.dart';

class TextConstant {
  static List<String> months = [
    LocalizationService.of().getLocale.january,
    LocalizationService.of().getLocale.february,
    LocalizationService.of().getLocale.march,
    LocalizationService.of().getLocale.april,
    LocalizationService.of().getLocale.may,
    LocalizationService.of().getLocale.june,
    LocalizationService.of().getLocale.july,
    LocalizationService.of().getLocale.august,
    LocalizationService.of().getLocale.september,
    LocalizationService.of().getLocale.october,
    LocalizationService.of().getLocale.november,
    LocalizationService.of().getLocale.december
  ];
}
