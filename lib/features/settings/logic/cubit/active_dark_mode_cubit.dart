import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/services/hive_service.dart';

class ActiveDarkModeCubit extends Cubit<ThemeMode> {
  ActiveDarkModeCubit() : super(ThemeMode.light) {
    loadTheme();
  }

  void loadTheme() {
    bool isDark = HiveService().getChachedDarkMode();
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleDarkMode() {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    HiveService().cacheDarkMode(newMode == ThemeMode.dark);
    emit(newMode);
  }
}
