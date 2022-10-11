import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:snookerpad/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
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
}
