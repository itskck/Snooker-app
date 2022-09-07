part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final ThemeData theme = ThemeData();

  @override
  List<Object> get props => [theme];
}

class ThemeLight extends ThemeState {
  ThemeLight();

  @override
  final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.greenAccent,
    brightness: Brightness.light,
  );

  @override
  List<Object> get props => [theme];
}

class ThemeDark extends ThemeState {
  @override
  final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.greenAccent,
    brightness: Brightness.dark,
  );

  @override
  List<Object> get props => [theme];
}
