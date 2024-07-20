part of 'rules_cubit.dart';

abstract class RulesState extends Equatable {
  const RulesState();

  @override
  List<Object> get props => [];
}

class RulesLanguageSet extends RulesState {
  RulesLanguageSet(
    this.pdfDocument,
    this.currentLocale,
  );

  final PDFDocument pdfDocument;
  final Locale currentLocale;
}

class RulesLanguageChanging extends RulesState {}

class RulesLanguageInitial extends RulesState {}

class RulesLanguageFail extends RulesState {}
