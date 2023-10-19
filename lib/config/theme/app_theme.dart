import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final bool isDarkMode;
  final Color colorSeed;

  AppTheme({
    this.isDarkMode = false,
    this.colorSeed = Colors.blueAccent,
  });

  ThemeData getAppTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorSeed,
        textTheme: GoogleFonts.montserratTextTheme(),
      );
  AppTheme copyWith({bool? isDarkMode, Color? colorSeed}) => AppTheme(
        isDarkMode: isDarkMode ?? this.isDarkMode,
        colorSeed: colorSeed ?? this.colorSeed,
      );
}
