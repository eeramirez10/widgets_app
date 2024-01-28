import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/is_dark_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_change_screen";
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDark = ref.watch(themeNotifierProvider).isDark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            }, 
            icon: Icon( !isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined)
          )
        ],
        
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();
  

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colorsList = ref.watch(colorListProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colorsList.length,
      itemBuilder: (context, i) {
        final color = colorsList[i];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: i, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(themeNotifierProvider.notifier).setColorTheme(value ?? 0);
          }
        );
      }
    );
  }
}
