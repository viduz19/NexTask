import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF604652);
  static const Color secondaryColor = Color(0xFF735557);
  static const Color accentColor = Color(0xFF97866A);
  static const Color backgroundColor = Color(0xFFD29F8F);
  static const Color whiteColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      surface: backgroundColor, // Replaced background with surface (Material 3)
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onSurface: primaryColor,
    ),
    
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: whiteColor),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accentColor,
      foregroundColor: whiteColor,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Theme (Minimal & Modern)
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: primaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: secondaryColor,
        fontSize: 14,
      ),
      bodyLarge: TextStyle( // Used for inputs
        color: primaryColor,
        fontSize: 16
      )
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      hintStyle: TextStyle(color: secondaryColor.withOpacity(0.7)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    
    // Time Picker Theme
    timePickerTheme: TimePickerThemeData(
      backgroundColor: backgroundColor,
      hourMinuteColor: primaryColor.withOpacity(0.1),
      hourMinuteTextColor: primaryColor,
      dayPeriodColor: accentColor.withOpacity(0.2),
      dayPeriodTextColor: primaryColor,
      dialHandColor: accentColor,
      dialBackgroundColor: Colors.white.withOpacity(0.5),
    ), 

    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF2C2C2C), // Dark background
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      surface: const Color(0xFF1E1E1E),
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onSurface: const Color(0xFFE0E0E0),
    ),
    
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: whiteColor),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accentColor,
      foregroundColor: whiteColor,
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    // Text Theme (Dark Mode)
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: whiteColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFB0B0B0),
        fontSize: 14,
      ),
      bodyLarge: TextStyle( // Used for inputs
        color: whiteColor,
        fontSize: 16
      )
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF383838),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
    
    // Time Picker Theme
    timePickerTheme: TimePickerThemeData(
      backgroundColor: const Color(0xFF2C2C2C),
      hourMinuteColor: const Color(0xFF383838),
      hourMinuteTextColor: whiteColor,
      dayPeriodColor: accentColor.withOpacity(0.2),
      dayPeriodTextColor: whiteColor,
      dialHandColor: accentColor,
      dialBackgroundColor: const Color(0xFF383838),
    ), 

    useMaterial3: true,
  );
}
