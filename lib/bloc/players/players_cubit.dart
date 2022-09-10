import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:snookerpad/models/player/player.dart';

part 'players_state.dart';

class PlayersCubit extends HydratedCubit<PlayersState> {
  PlayersCubit() : super(PlayersWithData([]));

  void updatePlayers(List<Player> players) => emit(PlayersWithData(players));

  @override
  PlayersState? fromJson(Map<String, dynamic> json) {
    try {
      final playerList = (json['players'] as List)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList();
      return PlayersWithData(playerList);
    } catch (_, __) {
      return PlayersWithData([]);
    }
  }

  @override
  Map<String, dynamic>? toJson(PlayersState state) {
    if (state is PlayersWithData) {
      return {'players': state.players};
    } else {
      return {};
    }
  }
}
