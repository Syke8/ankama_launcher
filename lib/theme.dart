import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = Provider(((_) => AppTheme.ankama()));

class AppTheme {
  AppTheme({
    required this.scheme,
    this.textTheme,
  });

  factory AppTheme.ankama() => AppTheme(
        scheme: ColorScheme.fromSeed(
          seedColor: Colors.orange.shade400,
          brightness: Brightness.dark,
        ),
      );

  final ColorScheme scheme;
  final TextTheme? textTheme;

  ThemeData get data => ThemeData.from(
        colorScheme: scheme,
        textTheme: textTheme,
      ).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          isDense: true,
          fillColor: Colors.black54,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
            borderSide: BorderSide.none,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(scheme.primary),
          fillColor: MaterialStateProperty.all(Colors.transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          side: MaterialStateBorderSide.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(color: scheme.primary);
            }

            return const BorderSide(color: Colors.white);
          }),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(42.0),
            textStyle: const TextStyle(fontSize: 16.0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: const StadiumBorder(),
          ),
        ),
      );
}