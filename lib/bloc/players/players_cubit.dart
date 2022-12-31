import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snookerpad/bloc/frames/frames_cubit.dart';
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
      final playersToEmit = (state as PlayersWithData).players;

      switch (sortType) {
        case sortTypes.won:
          playersToEmit.sort((a, b) => a.frameswon.compareTo(b.frameswon));
          break;
        case sortTypes.lost:
          playersToEmit.sort((a, b) => a.frameslost.compareTo(b.frameslost));
          break;
        case sortTypes.ratio:
          playersToEmit.sort(
            (a, b) {
              if ((a.frameslost + a.frameswon == 0) ||
                  (b.frameslost + b.frameswon == 0)) {
                return (a.frameswon / 1).compareTo(
                  (b.frameswon / 1),
                );
              }
              return (a.frameswon / (a.frameslost + a.frameswon)).compareTo(
                (b.frameswon / (b.frameslost + b.frameswon)),
              );
            },
          );
          break;
        case sortTypes.maxbreak:
          playersToEmit.sort((a, b) => a.maxbreak.compareTo(b.maxbreak));
          break;
      }

      emit(PlayersWithData(playersToEmit.reversed.toList()));
    }
  }

  Future<void> updateImage(Player player) async {
    final picker = ImagePicker();
    final newImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
      preferredCameraDevice: CameraDevice.front,
    );
    if (newImage == null) return;

    final bytes = await newImage.readAsBytes();
    editPlayer(player, image: bytes);
  }

  void addPlayer(Player player) {
    final newPlayerList = players;
    if (newPlayerList.any((element) => element.name == player.name)) {
      showToast(tr('cannot_be_the_same'));
      return;
    }
    emit(PlayersChangingState());
    final lastId = getMaxId(newPlayerList);
    newPlayerList.add(
      player.copyWith(
        id: lastId + 1,
      ),
    );

    emit(PlayersWithData(newPlayerList));
  }

  Future<void> editPlayer(
    Player player, {
    Uint8List? image,
    String? name,
    int? maxbreak,
    bool? won,
  }) async {
    final newPlayerList = players;
    var newPlayer = players.firstWhere((element) => element.id == player.id);
    emit(PlayersChangingState());
    newPlayerList.removeWhere((element) => element.id == player.id);

    if (image != null) {
      newPlayer = newPlayer.copyWith(picture: image);
    }
    if (name != null) {
      newPlayer = newPlayer.copyWith(name: name);
    }
    if (maxbreak != null && maxbreak > newPlayer.maxbreak) {
      newPlayer = newPlayer.copyWith(maxbreak: maxbreak);
    }
    if (won != null) {
      if (won == true) {
        newPlayer = newPlayer.copyWith(frameswon: newPlayer.frameswon + 1);
      } else if (won == false) {
        newPlayer = newPlayer.copyWith(frameslost: newPlayer.frameslost + 1);
      }
    }

    newPlayerList.add(newPlayer);
    emit(PlayersWithData(newPlayerList));
  }

  void deletePlayerData(int playerId) {
    try {
      final newPlayerList = players;
      var newPlayer = players.firstWhere((element) => element.id == playerId);
      newPlayer = newPlayer.copyWith(
        frameslost: 0,
        frameswon: 0,
        maxbreak: 0,
      );
      newPlayerList.removeWhere((element) => element.id == playerId);
      emit(PlayersWithData([...newPlayerList, newPlayer]));
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  void deletePlayer(int playerId, BuildContext context) {
    try {
      final newPlayerList = players;
      emit(PlayersChangingState());
      newPlayerList.removeWhere((element) => element.id == playerId);
      BlocProvider.of<FramesCubit>(context).removePlayerFrames(playerId);
      emit(PlayersWithData(newPlayerList));
    } catch (error, s) {
      log(
        error.toString(),
        stackTrace: s,
      );
    }
  }

  void deleteAll(BuildContext context) {
    BlocProvider.of<FramesCubit>(context).removeAllFrames();
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
