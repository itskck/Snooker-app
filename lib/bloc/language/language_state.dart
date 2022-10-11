part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageSet extends LanguageState {
  LanguageSet(this.locale);

  final Locale locale;

  @override
  List<Object> get props => [locale];
}

class LanguageChanging extends LanguageState {
  @override
  List<Object> get props => [];
}
