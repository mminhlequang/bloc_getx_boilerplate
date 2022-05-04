
import 'package:get/get.dart';

import '../../main.dart';
import '../utils/utils.dart';
import 'fr_fr_translation.dart';
import 'en_us_translations.dart';
import 'dart:ui';

//===== INPUT IN MAIN FILE
//
// static void setLocale(BuildContext context, Locale newLocale) {
//   _AppState state = context.findAncestorStateOfType<_AppState>()!;
//   state.setLocale(newLocale);
// }
//
// Locale? _locale;
// setLocale(Locale locale) {
//   setState(() {
//     _locale = locale;
//   });
// }

// @override
// void didChangeDependencies() async {
//   setState(() {
//     this._locale = getLocale();
//   });
//   super.didChangeDependencies();
// }

//languages code
const String ENGLISH = 'en';
const String FRENCH = 'fr';

List languagelist = [
  ENGLISH,
  FRENCH,
];

List<Locale> supportedlocale = [
  Locale(ENGLISH, "US"),
  Locale(FRENCH, 'FR'),
];

void setLocale(languageCode) {
  if (supportedlocale.any((e) => e.languageCode == languageCode)) {
    AppPrefs.languageCode = languageCode;
    Get.locale =
        supportedlocale.firstWhere((e) => e.languageCode == languageCode);
    App.setLocale(Get.context!,
        supportedlocale.firstWhere((e) => e.languageCode == languageCode));
  }
}

Locale getLocale() {
  if (AppPrefs.languageCode != null) return _locale(AppPrefs.languageCode!);
  final Locale systemLocales = window.locale;
  return _locale(systemLocales.languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case FRENCH:
      return Locale(FRENCH, 'FR');
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    default:
      return Locale(ENGLISH, 'US');
  }
}

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'fr_FR': frFR
  };
}
