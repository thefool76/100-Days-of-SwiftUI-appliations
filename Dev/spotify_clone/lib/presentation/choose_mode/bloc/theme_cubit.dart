import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeModeString = json['themeMode'] as String?;
    if (themeModeString == 'light') {
      return ThemeMode.light;
    } else if (themeModeString == 'dark') {
      return ThemeMode.dark;
    }
    return ThemeMode.system; // Default value
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state == ThemeMode.light
          ? 'light'
          : state == ThemeMode.dark
              ? 'dark'
              : 'system',
    };
  }
}

