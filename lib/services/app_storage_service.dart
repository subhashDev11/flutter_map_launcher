import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_today/core/utils/logger_utils.dart';

const String userSessionKey = 'user_session';
const String appLanguageIndexKey = 'app_language_index_key';
const String appThemeKey = 'app_theme_key';
const String monthlyUpdateFormDraft = 'monthly_update_draft';
const String askForUpdateMobile = 'ask_for_update_mobile';
const String userRegistrationToken = 'user_registration_token';

class AppStorageService {
  SharedPreferences? appPref;

  init() async {
    appPref = await SharedPreferences.getInstance();
  }

  Future<bool> setString({required String key, required String data}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      appPref?.setString(key, data);
      return true;
    } catch (e) {
      AppLogger.e('Exception to add data on pref -> $e');
      return false;
    }
  }

  Future<bool> setInt({required String key, required int data}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      appPref?.setInt(key, data);
      return true;
    } catch (e) {
      AppLogger.e('Exception to add data on pref -> $e');
      return false;
    }
  }

  Future<bool> setJSON({required String key, required Map<String, dynamic> mapData}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      final data = json.encode(mapData);
      appPref?.setString(key, data);
      return true;
    } catch (e) {
      AppLogger.e('Exception to add data on pref -> $e');
      return false;
    }
  }

  Future<String?>? getString({
    required String key,
  }) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      return appPref?.getString(key);
    } catch (e) {
      AppLogger.e('Exception to get data from pref -> $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?>? getJSON({
    required String key,
  }) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      final str = appPref?.getString(key);
      return json.decode(str ?? '');
    } catch (e) {
      AppLogger.e('Exception to get data from pref -> $e');
      return null;
    }
  }

  Future<bool> setBool({required String key, required bool value}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      appPref?.setBool(key, value);
      return true;
    } catch (e) {
      AppLogger.e('Exception to set data on pref -> $e');
      return false;
    }
  }

  Future<bool?> getBool({required String key}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      return appPref?.getBool(key);
    } catch (e) {
      AppLogger.e('Exception to get data from pref -> $e');
      return null;
    }
  }

  Future<int?> getInt({required String key}) async {
    try {
      appPref ??= await SharedPreferences.getInstance();
      return appPref?.getInt(key);
    } catch (e) {
      AppLogger.e('Exception to get data from pref -> $e');
      return null;
    }
  }

  Future delete(String key, bool clearAll) async {
    appPref ??= await SharedPreferences.getInstance();
    appPref?.remove(key);
    if (clearAll) {
      appPref?.clear();
    }
  }
}
