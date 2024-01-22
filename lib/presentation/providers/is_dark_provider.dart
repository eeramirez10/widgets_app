import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider((ref) => false);

final colorListProvider = StateProvider((ref) => colorsList);

final selectedColorProvider = StateProvider((ref) => 0);