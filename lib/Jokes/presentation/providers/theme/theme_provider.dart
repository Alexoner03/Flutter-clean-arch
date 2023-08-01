import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Config/themes/app_theme.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());
}
