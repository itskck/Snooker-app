import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeLight()) {
    hydrate();
  }

  @override
  void emit(ThemeState state) {
    super.emit(state);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return json['darkMode'] as bool ? ThemeDark() : ThemeLight();
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'darkMode': state.theme.brightness == Brightness.dark};
  }
}
