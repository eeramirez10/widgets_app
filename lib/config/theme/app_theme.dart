
import 'package:flutter/material.dart';

const colorsList = <Color> [
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.orange,
  Colors.deepPurple
];

class AppTheme {
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
  }): assert ( selectedColor >= 0, 'Color must be greather than 0'),
  assert (selectedColor < colorsList.length, 'Color must be less or equal than ${colorsList.length - 1}');


  ThemeData getTheme () {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );
  }


}