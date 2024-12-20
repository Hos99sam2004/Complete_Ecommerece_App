// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreference;

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreference!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreference!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreference!.setBool(key, value);
    } else {
      return await sharedPreference!.setDouble(key, value);
    }
  }

  static  getData({
    required String key,
  })  {
    return sharedPreference?.get(key);
  }

  static Future<bool> RemoveData({
    required String key,
  }) async {
  return await sharedPreference!.remove(key);
}





}


// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesHelper {
//   static SharedPreferences? _preferences;

//   // Initialize SharedPreferences (Call this in main or at app startup)
//   static Future<void> init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }

//   // Save a value (String, int, double, bool, List<String>)
//   static Future<bool> setValue<T>(String key, T value) async {
//     if (_preferences == null) {
//       throw Exception("SharedPreferences is not initialized. Call init() first.");
//     }

//     if (value is String) {
//       return await _preferences!.setString(key, value);
//     } else if (value is int) {
//       return await _preferences!.setInt(key, value);
//     } else if (value is double) {
//       return await _preferences!.setDouble(key, value);
//     } else if (value is bool) {
//       return await _preferences!.setBool(key, value);
//     } else if (value is List<String>) {
//       return await _preferences!.setStringList(key, value);
//     } else {
//       throw Exception("Unsupported type");
//     }
//   }

//   // Get a value (String, int, double, bool, List<String>)
//   static T? getValue<T>(String key) {
//     if (_preferences == null) {
//       throw Exception("SharedPreferences is not initialized. Call init() first.");
//     }

//     return _preferences!.get(key) as T?;
//   }

//   // Remove a value
//   static Future<bool> removeValue(String key) async {
//     if (_preferences == null) {
//       throw Exception("SharedPreferences is not initialized. Call init() first.");
//     }

//     return await _preferences!.remove(key);
//   }

//   // Clear all preferences
//   static Future<bool> clearAll() async {
//     if (_preferences == null) {
//       throw Exception("SharedPreferences is not initialized. Call init() first.");
//     }

//     return await _preferences!.clear();
//   }
// }
