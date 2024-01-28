import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider((ref) => false);

final colorListProvider = StateProvider((ref) => colorsList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme> (
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme>  {
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode (){
    state = state.copyWith(isDark: !state.isDark);
  }

  void setColorTheme (int selectedColor){
    state = state.copyWith(selectedColor: selectedColor);
  }
}