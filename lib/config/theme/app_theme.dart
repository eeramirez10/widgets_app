
import 'package:flutter/material.dart';

const colorsList = <Color> [
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.orange,
  Colors.deepPurple
];

class AppTheme  {
  final int selectedColor;
  final bool isDark;
  AppTheme({
    this.selectedColor = 0,
    this.isDark = false
  }): assert ( selectedColor >= 0, 'Color must be greather than 0'),
  assert (selectedColor < colorsList.length, 'Color must be less or equal than ${colorsList.length - 1}');


  ThemeData getTheme () {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorsList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );
  }


}