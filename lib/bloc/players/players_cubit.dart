import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snookerpad/models/player/player.dart';
import 'package:snookerpad/utils/enums.dart';
import 'package:snookerpad/utils/utils.dart';

part 'players_state.dart';

class PlayersCubit extends HydratedCubit<PlayersState> {
  PlayersCubit() : super(PlayersWithData([]));

  List<Player> get players =>
      state is PlayersWithData ? (state as PlayersWithData).players : [];

  void changeSortType({required sortTypes sortType}) {
    if (state is PlayersWithData) {
      final List<Player> playersToEmit = (state as PlayersWithData).players;

      switch (sortType) {
        case sortTypes.won:
          playersToEmit.sort(((a, b) => a.frameswon.compareTo(b.frameswon)));
          break;
        case sortTypes.lost:
          playersToEmit.sort(((a, b) => a.frameslost.compareTo(b.frameslost)));
          break;
        case sortTypes.ratio:
          playersToEmit.sort(((a, b) => a.ratio.compareTo(b.ratio)));
          break;
        case sortTypes.maxbreak:
          playersToEmit.sort(((a, b) => a.maxbreak.compareTo(b.maxbreak)));
          break;
      }
      print(playersToEmit);

      emit(PlayersWithData(playersToEmit.reversed.toList()));
    }
  }

  Future<void> updateImage(Player player) async {
    final ImagePicker picker = ImagePicker();
    final XFile? newImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
      preferredCameraDevice: CameraDevice.front,
    );
    if (newImage == null) return;

    final bytes = await newImage.readAsBytes();
    editPlayer(player, image: bytes);
  }

  void addPlayer(Player player) {
    List<Player> newPlayerList = players;
    emit(PlayersChangingState());
    int lastId = getMaxId(newPlayerList);
    newPlayerList.add(
      player.copyWith(
        id: lastId + 1,
      ),
    );

    emit(PlayersWithData(newPlayerList));
  }

  void editPlayer(Player player, {Uint8List? image, String? name}) {
    List<Player> newPlayerList = players;
    Player newPlayer = players.firstWhere((element) => element == player);
    emit(PlayersChangingState());
    newPlayerList.removeWhere((element) => element == player);

    if (image != null) {
      newPlayer = newPlayer.copyWith(picture: image);
    }
    if (name != null) {
      newPlayer = newPlayer.copyWith(name: name);
    }

    newPlayerList.add(newPlayer);
    emit(PlayersWithData(newPlayerList));
  }

  void deleteAll() {
    emit(PlayersWithData([]));
  }

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
