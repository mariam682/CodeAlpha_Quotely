import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        fontFamily: 'Georgia',
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFC9A96E),
          surface: Color(0xFF0F0C29),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: const Color(0xFF302B63),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentTextStyle: const TextStyle(
            fontFamily: 'Georgia',
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      );
}
