import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  
  static setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }

  static getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key) ?? "";
  }

  static removePref(String key) async {
    await _instance.remove(key);
  }

  
  static const String _searchHistoryKey = "search_history";

 
  static List<String> getSearchHistory() {
    return _instance.getStringList(_searchHistoryKey) ?? [];
  }

 
  static Future<void> addSearchQuery(String query, {int maxItems = 10}) async {
    final history = getSearchHistory();

   
    history.remove(query);
    history.insert(0, query);

   
    if (history.length > maxItems) {
      history.removeRange(maxItems, history.length);
    }

    await _instance.setStringList(_searchHistoryKey, history);
  }

  
  static Future<void> clearSearchHistory() async {
    await _instance.remove(_searchHistoryKey);
  }
}
