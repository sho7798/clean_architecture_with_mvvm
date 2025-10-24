// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:clean_architecture_mvvm/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  SharedPreferences? sharedPreferences;
  AppPreferences({this.sharedPreferences});

  Future<String> getAppLanguage() async {
    String? language = sharedPreferences?.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
