import 'dart:developer';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snookerpad/bloc/language/language_cubit.dart';
import 'package:snookerpad/utils/constants.dart';

part 'rules_state.dart';

class RulesCubit extends Cubit<RulesState> {
  RulesCubit(this._languageCubit) : super(RulesLanguageInitial());

  final LanguageCubit _languageCubit;

  Locale get currentLocale => state is RulesLanguageSet
      ? (state as RulesLanguageSet).currentLocale
      : Locale('en');

  factory RulesCubit.create(BuildContext context) {
    return RulesCubit(
      BlocProvider.of<LanguageCubit>(context),
    );
  }

  Future<void> initDocument() async {
    try {
      late final PDFDocument document;
      late final Locale locale;

      if (_languageCubit.state is LanguageSet) {
        if ((_languageCubit.state as LanguageSet).locale == englishLocale) {
          document = await PDFDocument.fromAsset(pdfEn);
          locale = englishLocale;
        } else {
          document = await PDFDocument.fromAsset(pdfPl);
          locale = polishLocale;
        }
      } else {
        document = await PDFDocument.fromAsset(pdfEn);
        locale = englishLocale;
      }
      emit(RulesLanguageSet(document, locale));
    } catch (error, s) {
      emit(RulesLanguageFail());
      log(error.toString(), stackTrace: s);
    }
  }

  Future<void> switchRulesLocale() async {
    try {
      final current = currentLocale;
      late final PDFDocument document;
      late final Locale localeToEmit;
      emit(RulesLanguageChanging());
      if (current == polishLocale) {
        document = await PDFDocument.fromAsset(pdfEn);
        localeToEmit = englishLocale;
      } else {
        document = await PDFDocument.fromAsset(pdfPl);
        localeToEmit = polishLocale;
      }
      emit(RulesLanguageSet(document, localeToEmit));
    } catch (error, s) {
      emit(RulesLanguageFail());
      log(error.toString(), stackTrace: s);
    }
  }
}
