part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserPreTutorial extends UserState {}

class UserTutorialCompleted extends UserState {}
