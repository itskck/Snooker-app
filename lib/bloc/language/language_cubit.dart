import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageSet(englishLocale));

  void changeLocale(Locale locale, BuildContext context) {
    try {
      emit(LanguageChanging());
      context.setLocale(locale);
      emit(LanguageSet(locale));
    } catch (e, s) {
      emit(LanguageSet(englishLocale));
      log(
        e.toString(),
        stackTrace: s,
      );
    }
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    if (json.containsKey('locale')) {
      print('locale from json: ' + json['locale'].toString());
      return LanguageSet(Locale(json['locale'] as String));
    } else {
      return LanguageSet(englishLocale);
    }
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    if (state is LanguageSet) {
      return {'locale': state.locale.languageCode};
    } else {
      return {};
    }
  }
}
