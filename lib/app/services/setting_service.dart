import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:json_theme/json_theme.dart';
import '../../common/ui.dart';
import 'translation_service.dart';
import 'dart:io';
class SettingsService extends GetxService{
  late GetStorage _box;
  late final _lightTheme;
  late final _darkTheme;
  
  SettingsService() {
    _box = GetStorage();

  }

  Future<SettingsService> init() async {
    final lightThemStr = await rootBundle.loadString("assets/themes/light_theme.json");
    final lightThemeJson = jsonDecode(lightThemStr);
    final darkThemeStr = await rootBundle.loadString("assets/themes/dark_theme.json");
    final darkThemeJson = jsonDecode(darkThemeStr);
    _lightTheme = ThemeDecoder.decodeThemeData(lightThemeJson);
    _darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson);
    return this;
  }

  ThemeData getLightTheme() {
    // TODO change font dynamically
    return _lightTheme;
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return _darkTheme;
  }

  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      String defaultLocale = Platform.localeName;
      _locale = defaultLocale;
    }
    return Get.find<TranslationService>().fromStringToLocale(_locale);
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
    }
  }
}