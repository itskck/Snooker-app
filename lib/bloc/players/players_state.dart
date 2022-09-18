part of 'players_cubit.dart';

abstract class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

class PlayersChangingState extends PlayersState {
  const PlayersChangingState();

  @override
  List<Object> get props => [];
}

class PlayersWithData extends PlayersState {
  const PlayersWithData(this.players);

  final List<Player> players;

  @override
  List<Object> get props => [players];
}
