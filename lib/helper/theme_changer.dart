import 'package:flutter/material.dart';
import 'package:gymbud/helper/Utilities.dart';
import 'package:gymbud/helper/customColors.dart';
import 'package:gymbud/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData? _selectedTheme;
  Typography? defaultTypography;
  ThemeData dark = ThemeData.dark();
  ThemeData light = ThemeData.light()..copyWith(
    primaryColor: CustomColor.blackColor
  );
  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    if (_selectedTheme == dark) {
      _selectedTheme = light;
      Utilities.isDarkTheme=false;
      await preferences.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      Utilities.isDarkTheme=true;
      await preferences.setBool("darkTheme", true);
    }
    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme!;

}
