import 'package:shared_preferences/shared_preferences.dart';

/// A thin async wrapper around SharedPreferences.
/// Renamed to avoid conflict with the official SharedPreferencesAsync class in newer versions.
class VideoPlayerPrefs {
  /// Cache the Future itself to prevent race conditions where multiple
  /// calls start initialization simultaneously.
  Future<SharedPreferences>? _prefsFuture;

  Future<SharedPreferences> get _prefs {
    // If the Future hasn't been created yet, create it immediately.
    // Subsequent calls will receive the same running Future.
    _prefsFuture ??= SharedPreferences.getInstance();
    return _prefsFuture!;
  }

  Future<int?> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<Set<String>> getKeys() async {
    final prefs = await _prefs;
    return prefs.getKeys();
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }
}
